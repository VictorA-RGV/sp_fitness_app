import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

String initData() {
  final AuthService auth = AuthService();
  return auth.getuid().toString();
}

class Tab2 extends StatelessWidget {
  Tab2({Key? key}) : super(key: key);

  // reads friend requests
  final Stream<QuerySnapshot> friendRequestsStream = FirebaseFirestore.instance
      .collection('Users')
      .where('uid', isEqualTo: initData())
      .snapshots();

  void acceptFriendRequest(String currentUserId, String friendEmail) async {
    final currentUserDocRef =
        FirebaseFirestore.instance.collection('Users').doc(currentUserId);

    final friendDocRef = FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: friendEmail);

    // Remove the friend's email from the current user's requests list
    currentUserDocRef.update({
      'requests': FieldValue.arrayRemove([friendEmail]),
    });

    // Add the friend's email to the current user's friends list
    currentUserDocRef.update({
      'friends': FieldValue.arrayUnion([friendEmail]),
    });

    // Get the friend's document reference
    final friendQuerySnapshot = await friendDocRef.get();
    final friendDoc = friendQuerySnapshot.docs.first;

    // Get the current user's email
    final currentUser = FirebaseAuth.instance.currentUser!;
    final currentUserEmail = currentUser.email;

    // Add the current user's email to the friend's friends list
    friendDoc.reference.update({
      'friends': FieldValue.arrayUnion([currentUserEmail]),
    });
  }

  void rejectFriendRequest(String currentUserId, String friendEmail) async {
    final currentUserDocRef =
        FirebaseFirestore.instance.collection('Users').doc(currentUserId);

    // Remove the friend's email from the current user's requests list
    currentUserDocRef.update({
      'requests': FieldValue.arrayRemove([friendEmail]),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Renders Requests
            const SizedBox(height: 16),
            StreamBuilder<QuerySnapshot>(
              stream: friendRequestsStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    final data = snapshot.requireData;
                    List<String> requestsList = List<String>.from(
                        // snapshot.data?.docs.first.data()!['requests']
                        data.docs[0]['requests']);
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: requestsList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 16.0);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
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
                            title: Text(
                              requestsList[index],
                              style: const TextStyle(
                                color: Colors.black,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.check, color: Colors.green),
                                  onPressed: () {
                                    // Accept friend request logic
                                    // If Accepted get rid of the request of that user and add them to the friends list.
                                    // The friend friend's list should get added with the user too
                                    //  acceptFriendRequest(userId, requestsList[index]); // Replace userId with the current user's ID
                                    acceptFriendRequest(
                                        data.docs[0].id, requestsList[index]);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.close, color: Colors.red),
                                  onPressed: () {
                                    // Reject friend request logic
                                    // If Rejected get rid of the request of that user.
                                    // rejectFriendRequest(userId, requestsList[index]); // Replace userId with the current user's ID
                                    rejectFriendRequest(
                                        data.docs[0].id, requestsList[index]);
                                  },
                                ),
                              ],
                            ),
                            subtitle: const Text(
                              'Joined on 01/01/2023',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
