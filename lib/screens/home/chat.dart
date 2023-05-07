import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

class ChatPage extends StatefulWidget {
  final String chatroomId;
  final String currentUserUid;

  const ChatPage({Key? key, required this.chatroomId, required this.currentUserUid})
      : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textEditingController = TextEditingController();
  types.User? _user;

  @override
  void initState() {
    super.initState();
    _user = types.User(id: widget.currentUserUid);
  }
Widget _buildMessage(BuildContext context, DocumentSnapshot<Map<String, dynamic>> document) {
  bool isCurrentUser = document['author']['id'] == FirebaseAuth.instance.currentUser!.uid;
  DateTime timestamp = DateTime.fromMillisecondsSinceEpoch(document['createdAt']);
  String formattedTimestamp = DateFormat('hh:mm a').format(timestamp);

  return Container(
    alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: isCurrentUser ? Colors.blue.shade400 : Colors.green.shade300, // Update colors here
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              document['text'],
              style: TextStyle(
                color: isCurrentUser ? Colors.white : Colors.black,
                fontFamily: 'Averta',
              ),
            ),
          ),
          Text(
            formattedTimestamp,
            style: TextStyle(
              fontSize: 12.0,
              color: isCurrentUser ? Color(0xFF40C8E8) : Colors.grey[600], // Update color here
            ),
          ),
        ],
      ),
    ),
  );
}

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Chat')),
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF8E2CF), // Change these colors for your desired gradient
            Color(0xFFD9F0F0),
          ],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: messages,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                      snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading');
                }

                return ListView.builder(
                  reverse: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildMessage(context, snapshot.data!.docs[index]);
                  },
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () {
                    print('Send: ${_textEditingController.text}');
                    _handleSendPressed(
                        types.PartialText(text: _textEditingController.text));
                    _textEditingController.clear();
                  },
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

   void _handleSendPressed(types.PartialText message) {
    if (_user != null) {
      final textMessage = types.TextMessage(
        author: _user!,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: message.text,
      );

      // Add message to Firestore
      FirebaseFirestore.instance
          .collection('Chatrooms')
          .doc(widget.chatroomId)
          .collection('messages')
          .add(textMessage.toJson());
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get messages {
    return FirebaseFirestore.instance
        .collection('Chatrooms')
        .doc(widget.chatroomId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
}
  Future<void> createChatroom(String user1Uid, String user2Uid) async {
  // Create a new chatroom document in the 'Chatrooms' collection
  DocumentReference chatroomDoc = await FirebaseFirestore.instance
      .collection('Chatrooms')
      .add({'user1': user1Uid, 'user2': user2Uid});

  // Update the user documents in the 'Users' collection to store the chatroom ID
  await FirebaseFirestore.instance
      .collection('Users')
      .doc(user1Uid)
      .update({'chatrooms': FieldValue.arrayUnion([chatroomDoc.id])});

  await FirebaseFirestore.instance
      .collection('Users')
      .doc(user2Uid)
      .update({'chatrooms': FieldValue.arrayUnion([chatroomDoc.id])});
}

