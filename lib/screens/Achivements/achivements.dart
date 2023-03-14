import 'package:flutter/material.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sp_fitness_app/shared/circularAchievments.dart';
import 'dart:math';

class Achivements extends StatefulWidget {
  Achivements({Key? key}) : super(key: key);

  @override
  _AchivementsState createState() => _AchivementsState();
}

class _AchivementsState extends State<Achivements> {
  final AuthService _auth = AuthService();
  // the list of doubles will be values set by all completeed workouts.
  List<double> progress = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
  final List<Map<String, dynamic>> achievementData = [
    {
      'image': 'images/flexingArm.png',
      'name': 'Big Muscles!',
      'color': Colors.red,
    },
    {
      'image': 'images/flexingArm.png',
      'name': 'Bigger Muscles!',
      'color': Colors.blueAccent,
    },
    {
      'image': 'images/flexingArm.png',
      'name': 'Massive Muscles!',
      'color': Colors.orange,
    },
    {
      'image': 'images/flexingArm.png',
      'name': 'Maximum Muscles! 1 ',
      'color': Colors.purple,
    },
    {
      'image': 'images/flexingArm.png',
      'name': 'Maximum Muscles! 2 ',
      'color': Colors.purple,
    },
    {
      'image': 'images/flexingArm.png',
      'name': 'Maximum Muscles! 3 ',
      'color': Colors.purple,
    },
  ];

  final Stream<QuerySnapshot> userData =
      FirebaseFirestore.instance.collection('Users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Progressions of app'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: const Icon(Icons.person),
            label: const Text('logout'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView.builder(
            itemCount: achievementData.length,
            itemBuilder: (context, index) {
              return AchievementCircs(
                image: achievementData[index]['image'],
                name: achievementData[index]['name'],
                color: achievementData[index]['color'],
                progress: progress[index],
                onIncrease: () {
                  setState(() {
                    progress[index] += 0.25;
                  });
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            bool isDone = false;
            int i = 0;
            while (!isDone && i < achievementData.length) {

              progress[i] += 0.25;
              if (progress[i] >= 1.0) {
                i++;
              } else {
                isDone = true;
              }
              
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
