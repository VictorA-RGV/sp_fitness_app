import 'package:flutter/material.dart';
import 'dart:math';

class AcievementCircs {
  double? progress = 0;

  Widget achivementCircle(String image, String name, Color color) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // The progression bar
                Transform.rotate(
                  angle: 3 * pi / 4,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey[300],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.yellow),
                    value:
                        progress, // This is how much it is filled. 1 would be full.
                    strokeWidth: 60, // Width of the bar.
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8)),
                const CircleAvatar(backgroundColor: Colors.white, radius: 40),
                // The picture
                CircleAvatar(
                  radius: 40, // Size of the inner portion color.
                  backgroundColor: color,
                  child: Image.asset(
                    image, // Note, the image should not have a background. Otherwise, it will look weird... unless it has a circular background.
                    height: 50,
                  ),
                ),
                const SizedBox(
                  height: 10, // Not sure if this makes a difference
                ),
                Padding(
                    padding: EdgeInsets.all(
                        25)), // Not sure if this makes a difference
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                // Image used to hold the current level of achivement
                Image.asset(
                  'images/crown.png',
                  height: 30,
                ),
                // Achievement Level
                Text(
                  '2',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            ),
          ],
        ),

        // Name of achivement - Should remain here
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        ),
        const Padding(padding: EdgeInsets.all(25)), // Super important spacing.
        const Padding(
            padding: EdgeInsets.fromLTRB(100, 0, 55,
                0)), // Spacing for when there are 2 achievements in a row
      ],
    );
  }

  void increaseVal() {
    progress = progress! + .25;
  }
}
