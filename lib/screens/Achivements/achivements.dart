import 'package:flutter/material.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "dart:math";
import 'package:sp_fitness_app/screens/Achivements/achivements.dart';

// landing page for a logged in user
class Achivements extends StatelessWidget {
  Achivements();
  final AuthService _auth = AuthService();
  //CollectionReference userI = FirebaseFirestore.instance.collection('Users');
  final Stream<QuerySnapshot> userData =
      FirebaseFirestore.instance.collection('Users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      // The bar at top
      appBar: AppBar(
        title: const Text('HomePage of app'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: const Icon(Icons.person),
              label: const Text('logout'))
        ],
      ),
      // The content of the screen
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // Alignment of the content
          mainAxisAlignment: MainAxisAlignment.center,
          // Where the content is placed
          children: <Widget>[
            AchivementCircle(
                "images/flexingArm.png", 'Big Muscles!', Colors.red)
          ],
        ),
      ),
    );
  }
}

Widget AchivementCircle(String image, String name, Color color) {
  return Container(
      child: Column(
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          // The progression bar
          Transform.rotate(
            angle: 3 * pi / 4,
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
              value: .2, // This is how much it is filled. 1 would be full.
              strokeWidth: 60,
            ),
          ),
          Padding(padding: const EdgeInsets.all(8)),
          CircleAvatar(backgroundColor: Colors.white, radius: 40),
          // The picture
          CircleAvatar(
              child: Image.asset(
                name,
                height: 30,
              ),
              radius: 42,
              backgroundColor: color),
          // A bit of spacing
          SizedBox(
            height: 10,
          ),
          // Name of achivement
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )
        ],
      )
    ],
  ));
}
// How to use AchivmentCircle('flexing_man.png', '3', 'Travel', Colors.teal[100])
// The png, progress, Name of Achivement, Background color