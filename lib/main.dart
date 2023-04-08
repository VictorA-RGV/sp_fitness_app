import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sp_fitness_app/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/models/user.dart';
import 'package:sp_fitness_app/shared/workoutdata.dart';
import 'firebase_options.dart';

void main() async {
  // initiate hive
  await Hive.initFlutter();
  // open a hive box
  await Hive.openBox("workout_database");
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: UserModel(uid: ''),
      value: AuthService().user,
      child: ChangeNotifierProvider(
        create: (context) => WorkoutData(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        ),
      ),
    );
  }
}
