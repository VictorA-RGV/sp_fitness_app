import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sp_fitness_app/services/auth.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Renders Current Friends
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
                              trailing: SizedBox(
                                width: 60,
                                child: ElevatedButton.icon(
                                  // onPressed: () => _addFriend(friend),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 255, 93, 81),
                                    padding: const EdgeInsets.all(8.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.swipe_down,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  label: const Text(""),
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
      ),
    );
  }
}
