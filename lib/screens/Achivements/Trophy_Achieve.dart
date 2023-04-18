import 'package:flutter/material.dart';
import 'package:sp_fitness_app/screens/Achivements/achivements.dart';
import 'package:sp_fitness_app/screens/Achivements/trophies.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sp_fitness_app/shared/circularAchievments.dart';
import 'achieveData.dart';
import 'package:sp_fitness_app/shared/Achievement_database.dart';


class ProgressScreen extends StatefulWidget {
  ProgressScreen({Key? key}) : super(key: key);

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final AuthService _auth = AuthService();
  final Stream<QuerySnapshot> userData =
      FirebaseFirestore.instance.collection('Users').snapshots();
  
  // Create an instance of AchievementDatabase
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          ' ',
          style: TextStyle(color: Colors.blueGrey),
        ),
        leading: const BackButton(
          color: Colors.blueGrey,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to trophies screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TrophiesPage(), //Achivements(), TrophiesPage(),
                  ),
                );
              },
              child: const Text('Trophies'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to achievements screen

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Achivements(), //Achivements(), TrophiesPage(),
                  ),
                );
              },
              child: const Text('Achievements'),
            ), const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                 resetAllValues();
                 //clearHiveBox();
              },
              child: Text('Reset All Values'),
            ),
          ],
        ),
      ),
    );
  }
}
