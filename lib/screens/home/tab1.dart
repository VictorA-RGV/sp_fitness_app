import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sp_fitness_app/screens/home/friendProfile.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:sp_fitness_app/screens/home/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:collection/collection.dart';

String initData() {
  final AuthService auth = AuthService();
  return auth.getuid().toString();
}

class Tab1 extends StatelessWidget {
  Tab1({Key? key}) : super(key: key);

  // reads friend requests
  final Stream<QuerySnapshot> friendRequestsStream = FirebaseFirestore.instance
      .collection('Users')
      .where('uid', isEqualTo: initData())
      .snapshots();

  Future<void> _pokeFriend(String friendId) async {
    final functions = FirebaseFunctions.instance;
    final pokeFunction = functions.httpsCallable('pokeFriend');
    await pokeFunction.call({'friendId': friendId});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                child: Column(children: [
      // Renders Current Friends
      const SizedBox(height: 16),
      StreamBuilder<QuerySnapshot>(
        stream: friendRequestsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              final data = snapshot.requireData;
              List<String> friendsList = List<String>.from(
                  // snapshot.data?.docs.first.data()!['requests']
                  data.docs[0]['friends']);
              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: friendsList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 16.0);
                },
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              'Delete Friend',
                              style: TextStyle(fontFamily: 'Averta'),
                            ),
                            content: Text(
                              'Are you sure you want to delete ${friendsList[index]}?',
                              style: const TextStyle(fontFamily: 'Averta'),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                      fontFamily: 'Averta',
                                      color: Colors.black),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // _deleteFriend(friendsList[index]);
                                  Navigator.of(context).pop(true);
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(
                                    fontFamily: 'Averta',
                                    color: Color.fromARGB(255, 255, 93, 81),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 0,
                            offset: const Offset(0, 1),
                          ),
                        ],
                        border: Border.all(
                          // color: Colors.grey.shade300,
                          color: Colors.transparent,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://twirpz.files.wordpress.com/2015/06/twitter-avi-gender-balanced-figure.png?w=640'),
                        ),
                        onTap: () => {
                         // print(data.docs[index]['email']),
                          print(friendsList[index]),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    friendProfile(friendsList[index]),
                              ))
                        },
                        title: Text(
                          friendsList[index],
                          style: const TextStyle(
                              color: Colors.black, fontFamily: 'Averta'
                              // fontWeight: FontWeight.bold,
                              ),
                        ),
                        subtitle: const Text(
                          'Joined on 01/01/2023',
                          style: TextStyle(
                              color: Colors.grey, fontFamily: 'Averta'),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.chat,
                                  color: Theme.of(context).primaryColor),
                              onPressed: () async {
                                print('Friend UID: ${friendsList[index]}');

                                QuerySnapshot<Map<String, dynamic>>
                                    querySnapshot = await FirebaseFirestore
                                        .instance
                                        .collection('Users')
                                        .where('email',
                                            isEqualTo: friendsList[index])
                                        .get();

                                if (querySnapshot.docs.isNotEmpty) {
                                  QueryDocumentSnapshot<Map<String, dynamic>>
                                      userDoc = querySnapshot.docs.first;
                                  print('Chatrooms: ${userDoc['chatrooms']}');
                                  // Get the current user's UID
                                  final currentUser =
                                      FirebaseAuth.instance.currentUser!;
                                  final currentUserEmail = currentUser.email!;

                                  String? chatroomId = await getChatroomId(
                                      currentUserEmail, friendsList[index]);

                                  if (chatroomId != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChatPage(
                                          chatroomId: chatroomId,
                                          currentUserUid: currentUser.uid,
                                        ),
                                      ),
                                    );
                                  } else {
                                    // Handle the case when no chatroom is found
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Chatroom not found'),
                                      ),
                                    );
                                  }
                                } else {
                                  // Show an error message or handle the case when no user document is found
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('User not found'),
                                    ),
                                  );
                                }
                              },
                            ),
                            SizedBox(width: 8),
                            IconButton(
                              icon: Icon(Icons.swipe_down,
                                  color: Theme.of(context).primaryColor),
                              onPressed: () {
                                _pokeFriend(friendsList[index]);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
          }
        },
      ),
    ]))));
  }
}

Future<String?> getChatroomId(
    String currentUserEmail, String friendEmail) async {
  final currentUserDocSnapshot = await FirebaseFirestore.instance
      .collection('Users')
      .where('email', isEqualTo: currentUserEmail)
      .get();
  final friendDocSnapshot = await FirebaseFirestore.instance
      .collection('Users')
      .where('email', isEqualTo: friendEmail)
      .get();

  if (currentUserDocSnapshot.docs.isNotEmpty &&
      friendDocSnapshot.docs.isNotEmpty) {
    DocumentSnapshot<Map<String, dynamic>> currentUserDoc =
        currentUserDocSnapshot.docs.first;
    DocumentSnapshot<Map<String, dynamic>> friendDoc =
        friendDocSnapshot.docs.first;

    List<String> currentUserChatrooms =
        List<String>.from(currentUserDoc['chatrooms']);
    List<String> friendChatrooms = List<String>.from(friendDoc['chatrooms']);

    for (final chatroom in currentUserChatrooms) {
      if (friendChatrooms.contains(chatroom)) {
        return chatroom;
      }
    }
  } else {
    print("User document(s) not found.");
  }
  return null;
}
