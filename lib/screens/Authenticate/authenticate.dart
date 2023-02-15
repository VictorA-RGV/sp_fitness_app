import 'package:flutter/material.dart';
import 'package:sp_fitness_app/screens/Authenticate/register.dart';
import 'package:sp_fitness_app/screens/Authenticate/sign_in.dart';

// this screen will autheticate user ID
class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
