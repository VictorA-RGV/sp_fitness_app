import 'package:flutter/material.dart';
import 'package:sp_fitness_app/services/auth.dart';

String initData() {
  final AuthService _auth = AuthService();
  return _auth.getuid().toString();
}
