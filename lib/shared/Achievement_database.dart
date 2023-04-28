import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../services/auth.dart';
import 'constants.dart';
import 'package:sp_fitness_app/screens/Achivements/achieveData.dart';

@HiveType(typeId: 0)
class Achievement {
  @HiveField(0)
  final String name;

  @HiveField(1)
  double progress;

  Achievement({required this.name, this.progress = 0.0});

  @override
  String toString() {
    return progress.toStringAsFixed(2);
  }
}

void updateAchievementProgress(String achievementName, double progress) {
  Box box = Hive.box("achievements");
  try {
    final achievement = box.values.firstWhere(
      (a) => a.name == achievementName,
      orElse: () => Achievement(name: achievementName),
    );
    achievement.progress = progress;
    box.put(achievementName, achievement);
  } catch (e) {
    print("Error updating achievement progress: $e");
  }
}

int currentIndex = 0;
void resetAllValues() async {
  Box box = Hive.box("achievements");
  await box.deleteFromDisk(); // delete the box from disk
  box = await Hive.openBox("achievements"); // recreate the box

  for (var i = 0; i < muscleList.length; i++) {
    updateAchievementProgress(muscleList[i]["name"], 0.0);
  }
  currentIndex = 0;
  print('is the box empty?: ${box.isEmpty}');
  final dataList = box.values.toList();
  for (var key in box.keys) {
    final value = box.get(key);
    print('$key: $value');
  }
}

void showCurrentDatabase() async {
  Box box = Hive.box("achievements");
  print('is the box empty?: ${box.isEmpty}');
  final dataList = box.values.toList();
  for (var key in box.keys) {
    final value = box.get(key);
    print('$key: $value');
  }
}

void clearHiveBox() async {
  Box box = Hive.box("achievements");
  await box.clear();
}

void updateAchievementData() {
  while (currentIndex < achievementData.length) {
    // Get the current achievement and its progress value
    var achievement = achievementData[currentIndex];
    var progress = getAchievementProgress(achievement['name']);
    print(achievement['name']);
    if (progress < 1.0) {
      // Update the progress value by 0.25
      updateAchievementProgress(achievement['name'], progress + 0.25);
      return; // exit the function after updating one achievement
    } else {
      // Move to the next achievement in the list
      currentIndex++;
    }
  }
}

double getAchievementProgress(String achievementName) {
  Box box = Hive.box("achievements");
  try {
    final achievement = box.values.firstWhere(
      (a) => a.name == achievementName,
      orElse: () => Achievement(name: achievementName),
    );
    return achievement.progress;
  } catch (e) {
    print("Error getting achievement progress: $e");
    return 0.0;
  }
}

String passCompletedWorkouts() {
  if (getAchievementProgress("Workouts Completed") > -1) {
    return getAchievementProgress("Workouts Completed").toInt().toString();
  } else {
    return '';
  }
}

List<Map<String, dynamic>> muscleList = [
  {"name": "Big Muscles!", "value": 0.0},
  {"name": "Bigger Muscles!", "value": 0.0},
  {"name": "Massive Muscles!", "value": 0.0},
  {"name": "Maximum Muscles! 1", "value": 0.0},
  {"name": "Maximum Muscles! 2", "value": 0.0},
  {"name": "Maximum Muscles! 3", "value": 0.0},
  {"name": "Completed Tutorial", "value": 1.0},
  {"name": "Daily Login", "value": 0.71},
  {"name": "Feedback Pro", "value": 0.5},
  {"name": "VIP User", "value": 0.0},
  {"name": "Social Media Guru", "value": 0.3},
  {"name": "Workouts Completed", "value": 0.0},
  {"name": "Motivator", "value": 0.0},
  {"name": "Progress Pal", "value": 0.0},
  {"name": "Bronze", "value": 0.0},
  {"name": "Silver", "value": 0.0},
  {"name": "Gold", "value": 0.0},
  {"name": "Platinum", "value": 0.0},
];

class AchievementAdapter extends TypeAdapter<Achievement> {
  @override
  final int typeId = 0;

  @override
  Achievement read(BinaryReader reader) {
    final name = reader.read();
    final progress = reader.readDouble();
    return Achievement(name: name, progress: progress);
  }

  @override
  void write(BinaryWriter writer, Achievement obj) {
    writer.write(obj.name);
    writer.writeDouble(obj.progress);
  }
}
