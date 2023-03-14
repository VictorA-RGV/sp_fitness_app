import 'package:flutter/material.dart';
import 'package:sp_fitness_app/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/models/user.dart';
import 'package:sp_fitness_app/shared/workoutdata.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return StreamProvider<UserModel?>.value(
      initialData: UserModel(uid: ''),
      value: AuthService().user,
      child: ChangeNotifierProvider(
        create: (context) => WorkoutData(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        ),
=======
    // Adrian's Code ===============
    // return ChangeNotifierProvider(
    //   create: (context) => WorkoutData(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    // Victor's Code =========================
    return StreamProvider<UserModel?>.value(
      initialData: UserModel(uid: ''),
      value: AuthService().user,
      child: const MaterialApp(
        // ==================================

        home: Wrapper(),
>>>>>>> 384028aac05b595dcf8302aceb8786d1fcdb16fe
      ),
    );
  }
}