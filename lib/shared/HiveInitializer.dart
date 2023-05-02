import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sp_fitness_app/screens/Achivements/achieveData.dart';
import 'Achievement_database.dart';
Future<void> initHive() async {
  try {
    await Hive.initFlutter();
     Hive.registerAdapter(AchievementAdapter());
    final box = await Hive.openBox("workout_database");
    
   //final dataList = box.values.toList();
   for (var key in box.keys) {
    final value = box.get(key);
    print('$key: $value');
  }



    final box2 = await Hive.openBox("achievements");
    for (var muscle in muscleList) {
      
      final muscleName = muscle['name'];
    
      if (!box2.containsKey(muscleName)) {
        final newMuscle = Achievement(name: muscleName, progress: muscle['value']);
        box2.put(muscleName, newMuscle);
      }
    }

    print('is the box empty?: ${box.isEmpty}');
    final dataList = box2.values.toList();
    for (var key in box2.keys) {
      final value = box2.get(key);
      print('$key: $value');
    }
  } catch (e) {
    // handle the exception
    print('An error occurred while initializing Hive: $e');
  }

  //print(dataList);
}
