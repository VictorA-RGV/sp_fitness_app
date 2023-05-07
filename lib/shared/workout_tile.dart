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
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.8),
                Theme.of(context).primaryColor.withOpacity(0.6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
          child: ListTile(
            title: Text(
              workoutName.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
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