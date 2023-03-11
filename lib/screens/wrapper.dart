import 'package:flutter/material.dart';


import 'package:sp_fitness_app/screens/Authenticate/register.dart';
import 'package:sp_fitness_app/screens/RegistrationProcess/strength.dart';

import 'package:sp_fitness_app/screens/Startup/testscreen.dart';
import 'package:sp_fitness_app/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:sp_fitness_app/models/user.dart';

import 'package:sp_fitness_app/screens/Startup/get_started.dart';

//depending if the user is logged in or not will be moved to either authenticate or home page
class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Authenticate page or home, using a stream which detects authentication changes

    final user = Provider.of<UserModel?>(context);
    // If user is not logged in then brings us to the GetStarted Screen
    if (user == null) {
      // return const Authenticate();
      // return Testscreen();
      print(user);
      print(' in null');
      return GetStarted(); // takes us to get started screen
    }
    // If the User is logged in. Brings us to the Home Screen
    else {
      print(user);
      print('in home');
      return Home();
    }
  }
}
