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
      _addWorkoutBadge(context);

      updateAchievementProgress('Bronze', getAchievementProgress('Bronze') + 1);
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
          'Badges ',
          style: TextStyle(color: Colors.blueGrey),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context); // Generate the previous page
          },
          child: BackButton(
            color: Colors.blueGrey,
          ),
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
              if (index == 0) {
                // First item is top centered
                return Center(
                  child: AchievementCircs(
                    image: achievementData[index]['image'],
                    name: achievementData[index]['name'],
                    color: achievementData[index]['color'],
                    progress:
                        getAchievementProgress(achievementData[index]['name']),
                  ),
                );
              } else if (index == achievementData.length - 1) {
                // Last item is bottom centered
                return Center(
                  child: AchievementCircs(
                    image: achievementData[index]['image'],
                    name: achievementData[index]['name'],
                    color: achievementData[index]['color'],
                    progress:
                        getAchievementProgress(achievementData[index]['name']),
                  ),
                );
              } else if ((index - 2) % 2 == 0) {
                // Items in pairs
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AchievementCircs(
                      image: achievementData[index - 1]['image'],
                      name: achievementData[index - 1]['name'],
                      color: achievementData[index - 1]['color'],
                      progress: getAchievementProgress(
                          achievementData[index - 1]['name']),
                    ),
                    AchievementCircs(
                      image: achievementData[index]['image'],
                      name: achievementData[index]['name'],
                      color: achievementData[index]['color'],
                      progress: getAchievementProgress(
                          achievementData[index]['name']),
                    ),
                  ],
                );
              } else {
                // Ignore odd numbered items
                return SizedBox.shrink();
              }
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

void _addWorkoutBadge(BuildContext context) async {
  final userDocs = await FirebaseFirestore.instance
      .collection('Users')
      .where('uid', isEqualTo: initData())
      .get();

  if (userDocs.docs.isEmpty) {
    print('Document does not exist');
    return;
  }
  final userDocRef = userDocs.docs.first.reference;
  final userDataMap = userDocs.docs.first.data() as Map<String, dynamic>?;

  if (userDataMap == null) {
    print('User data is null');
    return;
  }

  final badges = userDataMap.containsKey('badges')
      ? userDataMap['badges'] as List<dynamic>
      : [];

  if (badges.contains('Workout Badge')) {
    print('User already has Workout Badge');
    return;
  }

  final newBadges = [...badges, 'Workout Badge'];
  final newUserData = {...userDataMap, 'badges': newBadges};
  await userDocRef.update(newUserData);

  // Show a snackbar to indicate that the badge has been added
}

void _addCustomBadge(String badgeName, BuildContext context) async {
  final userDocs = await FirebaseFirestore.instance
      .collection('Users')
      .where('uid', isEqualTo: initData())
      .get();

  if (userDocs.docs.isEmpty) {
    print('Document does not exist');
    return;
  }
  final userDocRef = userDocs.docs.first.reference;
  final userDataMap = userDocs.docs.first.data() as Map<String, dynamic>?;

  if (userDataMap == null) {
    print('User data is null');
    return;
  }

  final badges = userDataMap.containsKey('badges')
      ? userDataMap['badges'] as List<dynamic>
      : [];

  if (badges.contains(badgeName)) {
    print('User already has $badgeName');
    return;
  }

  final newBadges = [...badges, badgeName];
  final newUserData = {...userDataMap, 'badges': newBadges};
  await userDocRef.update(newUserData);

  // Show a snackbar to indicate that the badge has been added
}
