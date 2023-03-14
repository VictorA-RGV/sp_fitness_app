import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WorkoutTile extends StatelessWidget {
  final String workoutName;
  void Function()? onPressed;
  void Function(BuildContext)? onEditTapped;
  void Function(BuildContext)? onDeleteTapped;

  WorkoutTile({
    super.key,
    required this.workoutName,
    required this.onPressed,
    required this.onEditTapped,
    required this.onDeleteTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            // settings option
            SlidableAction(
              onPressed: onEditTapped,
              backgroundColor: Colors.grey.shade800,
              icon: Icons.settings,
              borderRadius: BorderRadius.circular(12),
            ),

            // delete option
            SlidableAction(
              onPressed: onDeleteTapped,
              backgroundColor: Colors.red.shade400,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal[900],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
          child: ListTile(
            title: Text(
              workoutName.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
           // leading: Image.asset('lib/images/barbell.png', height: 36),
            trailing: IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
