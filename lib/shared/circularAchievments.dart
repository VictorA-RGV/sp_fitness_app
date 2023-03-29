import 'package:flutter/material.dart';
import 'dart:math';

class AchievementCircs extends StatefulWidget {
  final String image;
  final String name;
  final Color color;
  final double progress;
  final void Function() onIncrease;

  const AchievementCircs({
    required this.image,
    required this.name,
    required this.color,
    required this.progress,
    required this.onIncrease,
    Key? key,
  }) : super(key: key);
  //Fake comment for git

  @override
  _AchievementCircsState createState() => _AchievementCircsState();
}

class _AchievementCircsState extends State<AchievementCircs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(5)),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // The progression bar
                Transform.rotate(
                  angle: 0 * pi / 4,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 255, 93, 81)),
                    value: widget
                        .progress, // This is how much it is filled. 1 would be full.
                    strokeWidth: 60, // Width of the bar.
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8)),
                const CircleAvatar(backgroundColor: Colors.white, radius: 40),
                // The picture
                CircleAvatar(
                  radius: 35, // Size of the inner portion color.
                  backgroundColor: widget.color,
                  child: Image.asset(
                    widget
                        .image, // Note, the image should not have a background. Otherwise, it will look weird... unless it has a circular background.
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
                  '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(5)),
        // Name of achivement - Should remain here
        Text(
          widget.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        const Padding(padding: EdgeInsets.all(27)), // Super important spacing.
        const Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 55,
                0)), // Spacing for when there are 2 achievements in a row
      ],
    );
  }
}
