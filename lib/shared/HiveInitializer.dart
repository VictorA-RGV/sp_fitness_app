import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  final box = await Hive.openBox("workout_database");

   //final dataList = box.values.toList();
   for (var key in box.keys) {
    final value = box.get(key);
    print('$key: $value');
  }
  //print(dataList);
}