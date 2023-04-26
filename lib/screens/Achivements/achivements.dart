import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sp_fitness_app/shared/circularAchievments.dart';
import 'package:sp_fitness_app/shared/constants.dart';
import 'achieveData.dart';
import 'package:sp_fitness_app/shared/Achievement_database.dart';

// import 'dart:math';
bool hasBeenCalled = false;

void myMethod(BuildContext context) async {
  if (!hasBeenCalled) {
    if (getAchievementProgress("Maximum Muscles! 3") == 1.0) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => showCustomDialog(context));
    }
    hasBeenCalled = true;
  }
}

class Achivements extends StatefulWidget {
  Achivements({Key? key}) : super(key: key);

  // Fake comment to trigger git
  @override
  _AchivementsState createState() => _AchivementsState();
}

class _AchivementsState extends State<Achivements> {
  final AuthService _auth = AuthService();
  //Initializing progress with a list of six 0.0 values and a list of achievement data containing map objects of achievement details.

  final Stream<QuerySnapshot> userData =
      FirebaseFirestore.instance.collection('Users').snapshots();
  // The build method is overridden and a Scaffold widget with an AppBar and a body is returned.
  @override
  Widget build(BuildContext context) {
    myMethod(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Bicep Builder ',
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
        padding: const EdgeInsets.all(0.0),
        child: Center(
          // A ListView builder is used to create a list of AchievementCircs widget with details from achievementData and progress values.
          child: ListView.builder(
            itemCount: achievementData.length,
            itemBuilder: (context, index) {
              return AchievementCircs(
                image: achievementData[index]['image'],
                name: achievementData[index]['name'],
                color: achievementData[index]['color'],
                progress:
                    getAchievementProgress(achievementData[index]['name']),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        //A FloatingActionButton widget is added that when pressed, updates the progress values by 0.25,
        //and when any value reaches 1.0, it moves on to the next achievement in the list.
        //If all the achievements are completed, it prints "complete!" to the console.
        onPressed: () async {
          setState(() {
            updateAchievementData();
            hasBeenCalled = false;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
