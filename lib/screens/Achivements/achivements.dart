import 'package:flutter/material.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "dart:math";
import 'package:sp_fitness_app/shared/circularAchievments.dart';

// landing page for a logged in user
// ignore: must_be_immutable
class Achivements extends StatefulWidget {
  Achivements({super.key});

  @override
  State<Achivements> createState() => _AchivementsState();
}

double? progress = 0.0;

class _AchivementsState extends State<Achivements> {
  final AuthService _auth = AuthService();
  dynamic alpha = AcievementCircs().achivementCircle("images/flexingArm.png", 'Big Muscles!', Colors.red); 
  //CollectionReference userI = FirebaseFirestore.instance.collection('Users');
  final Stream<QuerySnapshot> userData =
      FirebaseFirestore.instance.collection('Users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        child: Center(
          child: Column(
            // Alignment of the content
            mainAxisAlignment: MainAxisAlignment.center,
            // Where the content is placed
            children: [
              alpha,
              Row(
                children: [
                  AcievementCircs().achivementCircle("images/flexingArm.png", 'Bigger Muscles!',
                      Colors.blueAccent),
                  const Padding(padding: EdgeInsets.all(20)),
                  AcievementCircs().achivementCircle("images/flexingArm.png", 'Massive Muscles!',
                      Colors.orange),
                ],
              ),
              AcievementCircs().achivementCircle("images/flexingArm.png", 'Maximum Muscles!',
                  Colors.purple),
              AcievementCircs().achivementCircle("images/flexingArm.png", 'Muscular Achieved!',
                  Colors.yellow),
              FloatingActionButton(onPressed: () {
                AcievementCircs().achivementCircle("images/flexingArm.png", 'Bigger Muscles!',
                      Colors.blueAccent);
              })
            ],
          ),
        ),
      ),
    );
  }
}
