import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sp_fitness_app/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/models/user.dart';
import 'package:sp_fitness_app/shared/HiveInitializer.dart';
import 'package:sp_fitness_app/shared/workoutdata.dart';
import 'firebase_options.dart';

const bool isTesting =
    bool.fromEnvironment('FLUTTER_TEST', defaultValue: false);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (!isTesting) {
    initHive();
  }

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
