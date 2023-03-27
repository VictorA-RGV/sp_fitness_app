import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sp_fitness_app/screens/home/home.dart';
import 'package:sp_fitness_app/screens/Startup/get_started.dart';

//depending if the user is logged in or not will be moved to either authenticate or home page
class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Use a StreamBuilder to listen to changes in the authentication state
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // If there is no user logged in, return the GetStarted screen
        if (snapshot.data == null) {
          return GetStarted();
        }
        // Otherwise, return the Home screen
        else {
          return Home();
        }
      },
    );
  }
}
