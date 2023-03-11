import 'package:flutter/material.dart';
import 'package:sp_fitness_app/screens/Startup/get_started.dart';
import 'package:sp_fitness_app/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/models/user.dart';
import 'package:sp_fitness_app/shared/workoutdata.dart';

void main() async {
  // initalize hive
  //await Hive.initFlutter();

  // open a hive box
  //await Hive.openBox("workout_database2");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkoutData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Wrapper(),
        
      ),
    );
  }
}
