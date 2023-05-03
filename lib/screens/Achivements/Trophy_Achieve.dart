import 'package:flutter/material.dart';
import 'package:sp_fitness_app/screens/Achivements/achivements.dart';
import 'package:sp_fitness_app/screens/Achivements/tasksAndBadges.dart';
import 'package:sp_fitness_app/screens/Achivements/trophies.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sp_fitness_app/shared/Achievement_database.dart';
import 'package:sp_fitness_app/shared/constants.dart';

class ProgressScreen extends StatefulWidget {
  ProgressScreen({Key? key}) : super(key: key);

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final AuthService _auth = AuthService();
  final Stream<QuerySnapshot> userData =
      FirebaseFirestore.instance.collection('Users').snapshots();

  final Stream<QuerySnapshot> userData2 = FirebaseFirestore.instance
      .collection('Users')
      .where('uid', isEqualTo: initData())
      .snapshots();


void _deleteBadges() async {
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

  final newUserData = {...userDataMap, 'badges': []};
  await userDocRef.update(newUserData);

  // Show a snackbar to indicate that the badges have been deleted
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Badges have been deleted.'),
    ),
  );
}



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
            StreamBuilder<QuerySnapshot>(
              stream: userData2,
              builder: (
                BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot,
              ) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong.');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading...');
                }
                final data = snapshot.requireData;
                final userDataMap =
                    snapshot.requireData.docs[0].data() as Map<String, dynamic>;
                final badges = userDataMap.containsKey('badges')
                    ? userDataMap['badges'] as List<dynamic>
                    : [];

                return Column(
                  children: [
                    Text(
                      "Hello, ${data.docs[0]['email']}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Badges:",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: badges.map((badge) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'images/flexingArm1.png', // replace with your badge image path
                                height: 50,
                              ),
                              Text(
                                badge.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                );
                
              },
            ),
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
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                resetAllValues();
              },
              child: Text('Reset All Values'),
            ),
            ElevatedButton(
              onPressed: () {
                clearHiveBox();
              },
              child: Text('Clear Trophy/Achieve Values'),
            ),
           ElevatedButton(
              onPressed: _deleteBadges,
              child: Text('delete badges'),
            ),ElevatedButton(
              onPressed: (){ Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CurrencyScreen(), //Achivements(), TrophiesPage(),
                  ),
                );},
              child: Text('currency screen'),
            ),
          ],
        ),
      ),
    );
  }
}

String initData() {
  final AuthService _auth = AuthService();
  return _auth.getuid().toString();
}
