import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class friendProfile extends StatefulWidget {
  String friendEmail;
  friendProfile(this.friendEmail);

  @override
  _friendProfile createState() => _friendProfile();
}

class _friendProfile extends State<friendProfile> {
  final AuthService _auth = AuthService();
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //CollectionReference userI = FirebaseFirestore.instance.collection('Users');
  final Stream<QuerySnapshot> userData =
      FirebaseFirestore.instance.collection('Users').snapshots();
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> userData2 = FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: widget.friendEmail)
        .snapshots(); // This was possible?!
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
              label: const Text('logout',
                  style: TextStyle(color: Colors.blueGrey)),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
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
                    return Stack(children: [
                      Container(
                        width: 375,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 10,
                              blurRadius: 3,
                              // changes position of shadow
                            )
                          ],
                        ),
                      ),
                      Positioned(
                          top: 20,
                          left: 80,
                          child: "${data.docs[0]['ProfilePic']}" == ""
                              ? const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://cdn-icons-png.flaticon.com/512/147/147133.png'),
                                  radius: 100,
                                )
                              : CircleAvatar(
                                  radius: 100,
                                  backgroundImage: NetworkImage(
                                      "${data.docs[0]['ProfilePic']}"))),
                    ]);
                  },
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
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text('Loading...');
                        }
                        // Get User Data
                        final data = snapshot.requireData;
                        return Stack(
                          children: [
                            Container(
                                width: 375,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.07),
                                      spreadRadius: 10,
                                      blurRadius: 3,
                                      // changes position of shadow
                                    )
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    const Text(
                                      "  Username",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      textAlign: TextAlign.left,
                                    ),
                                    // Container for Username. Will display the username
                                    const Text("  Username placeholder",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        )),
                                    const Text("  Email",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    Text("  ${data.docs[0]['email']}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    const Text("  Age",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    Text("  ${data.docs[0]['age']}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    const Text("  Gender",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    Text("  ${data.docs[0]['gender']}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    const Text("  Level",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    Text("  ${data.docs[0]['selection']}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    const Text("  Initial Weight",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    Text("  ${data.docs[0]['weight']}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20))
                                  ],
                                )),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 25)),
                Container(
                  width: 375,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.07),
                        spreadRadius: 10,
                        blurRadius: 3,
                        // changes position of shadow
                      )
                    ],
                  ),
                  child: Column(children: [
                    Text("Achivements Place Holder")
                    // Place achivements here
                  ]),
                ),
              ],
            ),
          ),
        ));
  }

  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color(0xffeef444c);
  String profilePicLink = "";
  void pickUploadProfilePic() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
      imageQuality: 90,
    );

    Reference ref = FirebaseStorage.instance.ref().child("profilepic.jpg");

    await ref.putFile(File(image!.path));

    ref.getDownloadURL().then((value) async {
      setState(() {
        profilePicLink = value;
      });
    });
  }
}
