import 'package:flutter/material.dart';
import 'package:sp_fitness_app/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: UserModel(uid: ''),
      value: AuthService().user,
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}