import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sp_fitness_app/screens/Achivements/achieveData.dart';
import 'Achievement_database.dart';
Future<void> initHive() async {
  try {
    await Hive.initFlutter();
     Hive.registerAdapter(AchievementAdapter());
    await Hive.openBox("workout_database");
    final box = await Hive.openBox("achievements");
    for (var muscle in muscleList) {
      
      final muscleName = muscle['name'];
    
      if (!box.containsKey(muscleName)) {
        final newMuscle = Achievement(name: muscleName, progress: muscle['value']);
        box.put(muscleName, newMuscle);
      }
    }

    print('is the box empty?: ${box.isEmpty}');
    final dataList = box.values.toList();
    for (var key in box.keys) {
      final value = box.get(key);
      print('$key: $value');
    }
  } catch (e) {
    // handle the exception
    print('An error occurred while initializing Hive: $e');
  }
}
