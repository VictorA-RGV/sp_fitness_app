import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

class ChatPage extends StatefulWidget {
  final User user;

  const ChatPage({Key? key, required this.user}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final CollectionReference<Map<String, dynamic>> messageCollection =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController _textEditingController = TextEditingController();
  types.User? _user;

  @override
  void initState() {
    super.initState();
    _user = types.User(id: widget.user.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Column(
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

                return ListView(
                  reverse: true,
                  children: snapshot.data!.docs
                      .map((DocumentSnapshot<Map<String, dynamic>> document) {
                    types.Message message =
                        types.Message.fromJson(document.data()!);
                    return ListTile(
                      title: Text((message as types.TextMessage).text),
                    );
                  }).toList(),
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
    );
  }
  String getChatRoomId(String user1, String user2) {
  if (user1.hashCode <= user2.hashCode) {
    return '$user1-$user2';
  } else {
    return '$user2-$user1';
  }
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
    final chatRoomId = getChatRoomId(_user!.id, widget.user.uid);
    messageCollection.doc(chatRoomId).collection('messages').add(textMessage.toJson());
  }
}

 Stream<QuerySnapshot<Map<String, dynamic>>> get messages {
  final chatRoomId = getChatRoomId(_user!.id, widget.user.uid);
  return messageCollection
      .doc(chatRoomId)
      .collection('messages')
      .orderBy('createdAt', descending: true)
      .snapshots();
}}