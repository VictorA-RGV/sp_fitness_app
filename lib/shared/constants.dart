import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../services/auth.dart';
import 'Achievement_database.dart';

//create constant designs to be reused in the app. You can use .copywith to edit the input decoration
Widget showCustomDialog(BuildContext context) {
  bool showDialogFlag = true;
  if (showDialogFlag) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blueGrey, // set the background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // set the edges
          ),
          title: Center(
            child: Text(
              'Congratulations!',
              style: TextStyle(color: Colors.white),
            ),
          ),
          content: Container(
            height: 200,
            child: Column(
              children: [
                Lottie.network(
                  'https://assets5.lottiefiles.com/packages/lf20_touohxv0.json',
                  height: 150,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'You have successfully completed 1 month of weekly workouts!',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.blueGrey[400],
              child: TextButton(
                child: Text('OK',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17)),
                onPressed: () {
                  showDialogFlag = false;
                  
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
  return SizedBox.shrink();
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

String initData() {
  final AuthService _auth = AuthService();
  return _auth.getuid().toString();
}
