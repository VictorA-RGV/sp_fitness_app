import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sp_fitness_app/shared/Initdata.dart'; // Do not remove this

class profile extends StatelessWidget {
  final AuthService _auth = AuthService();
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //CollectionReference userI = FirebaseFirestore.instance.collection('Users');
  final Stream<QuerySnapshot> userData =
      FirebaseFirestore.instance.collection('Users').snapshots();
  // Collects User Specific Data
  final Stream<QuerySnapshot> userData2 = FirebaseFirestore.instance
      .collection('Users')
      .where('uid', isEqualTo: initData())
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackButton(
          color: Colors.blueGrey,
        ),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: const Icon(Icons.person, color: Colors.blueGrey),
            label:
                const Text('logout', style: TextStyle(color: Colors.blueGrey)),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/147/147133.png'),
              radius: 100,
            ), // Need a bigger icon...
            Padding(padding: EdgeInsets.only(bottom: 25)),
            Stack(
              children: [
                StreamBuilder<QuerySnapshot>(
                  // ???
                  stream: userData2,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot,
                  ) {
                    // If an error occurs when attempting to establish a connection to firebase.
                    if (snapshot.hasError) {
                      return const Text('Something went wrong.');
                    }
                    // If connection between firebase and app is not established right away.
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Loading...');
                    }
                    // Get User Data
                    final data = snapshot.requireData;
                    return Stack(
                      children: [
                        // Text for the container below
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text("Username",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        // Container for Username. Will display the username
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                          child: Container(
                            width: 375,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Text("  Username placeholder",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
                          child: Text("Email",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
                          child: Container(
                            width: 375,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text("  ${data.docs[0]['email']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 100, 0, 0),
                          child: Text("Age",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 125, 0, 0),
                          child: Container(
                            width: 375,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text("  ${data.docs[0]['age']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 150, 0, 0),
                          child: Text("Gender",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 175, 0, 0),
                          child: Container(
                            width: 375,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text("  ${data.docs[0]['gender']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 200, 0, 0),
                          child: Text("Level",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 225, 0, 0),
                          child: Container(
                            width: 375,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text("  ${data.docs[0]['selection']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 250, 0, 0),
                          child: Text("Initial Weight",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 275, 0, 0),
                          child: Container(
                            width: 375,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text("  ${data.docs[0]['weight']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}