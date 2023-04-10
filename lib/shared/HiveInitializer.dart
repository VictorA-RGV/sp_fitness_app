import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  await Hive.openBox("workout_database");
}