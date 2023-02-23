import 'package:flutter/material.dart';
import 'dart:math';

class AcievementCircs {
double? progress = 0;


Widget achivementCircle(
    String image, String name, Color color) {
  return Column(
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          // The progression bar
          Transform.rotate(
            angle: 3 * pi / 4,
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.yellow),
              value:
                  progress, // This is how much it is filled. 1 would be full.
              strokeWidth: 60,
            ),
          ),
          const Padding(padding: EdgeInsets.all(8)),
          const CircleAvatar(backgroundColor: Colors.white, radius: 40),
          // The picture
          CircleAvatar(
            radius: 42,
            backgroundColor: color,
            child: Image.asset(
              image,
              height: 50,
            ),
          ),
          // A bit of spacing
          const SizedBox(
            height: 10,
          ),
          // Name of achivement
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
        ],
      ),
      const Padding(padding: EdgeInsets.all(25)),
      const Padding(padding: EdgeInsets.fromLTRB(100, 0, 55, 0)),
    ],
  );
}

void increaseVal(){progress = progress! + .25;}
}