import 'package:flutter/material.dart';

class CustomButton1 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Key keyValue;

  CustomButton1(
      {required this.text, required this.onPressed, required this.keyValue});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: keyValue,
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(327, 50),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 93, 81),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
    );
  }
}
