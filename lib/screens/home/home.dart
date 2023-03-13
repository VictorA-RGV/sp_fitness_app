import 'package:flutter/material.dart';
import 'package:sp_fitness_app/screens/Achivements/achivements.dart';
import 'package:sp_fitness_app/screens/home/second_home.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sp_fitness_app/screens/home/second_home';

// landing page for a longed in user
class Home extends StatelessWidget {
  // Setting up object to use the Auth Service of Firebase. (Mainly to Sign Out or transmit data to database)
  final AuthService _auth = AuthService();
  //CollectionReference userI = FirebaseFirestore.instance.collection('Users');
  final Stream<QuerySnapshot> userData = FirebaseFirestore.instance.collection('Users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Maybe the color of the screen???
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        // Sets the Text on App Bar
        title: const Text('HomePage of app'),
        // Sets App Bar Color
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          // Creates a Icon Button to Sign Out
          TextButton.icon(
              onPressed: () async {
                // Signs out user
                await _auth.signOut();
              },
              // Icon used for the SignOut Button
              icon: const Icon(Icons.person),
              // The text beside it explaining the purpose of the button
              label: const Text('logout'))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Small Text explaining what is below
            Text('Read Data from Cloud Firestore'),
            Container(
              // Size of container
              height: 250,
              padding: const EdgeInsets.symmetric(vertical: 20),
              // ???
              child: StreamBuilder<QuerySnapshot>(
                // ???
                stream: userData,
                builder: (
                  BuildContext context,
                  // ???
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  // If an error occurs when attempting to establish a connection to firebase.
                  if (snapshot.hasError) {
                    return Text('Something went wrong.');
                  }
                  // If connection between firebase and app is not established right away.
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...');
                  }
                  // Gets the User ID
                  String uid = _auth.getuid();
                  // ???
                  final data = snapshot.requireData;
                  // If Snapshot is retrieved successfully.
                  return ListView.builder(
                    // Gets the number of rows in the database being looked at
                    itemCount: data.size,
                    // Converts each item into a widget based on the type of item it is.
                    itemBuilder: (context, index) {
                      // Prints the data
                      return Text(
                        'email: ${data.docs[index]['email']}  age: ${data.docs[index]['age']}   Weight: ${data.docs[index]['weight']}  gender: ${data.docs[index]['gender']}\n',
                      );
                    },
                  );
                },
              ),
            ),
            // Button that leads to Achivements Page
            ElevatedButton(
                onPressed: () {
                  // Takes us to Achievements Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Achivements(),
                    ),
                  );
                },
                // Text on Button
                child: const Text('Achivements')),
                ElevatedButton(
                onPressed: () {
                  // Takes us to Achievements Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondHomePage(),
                    ),
                  );
                },
                // Text on Button
                child: const Text('workout')),
          ],
        ),
      ),
    );
  }
}
