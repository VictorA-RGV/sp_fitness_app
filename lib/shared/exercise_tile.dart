import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExerciseTile extends StatelessWidget {
  void Function()? onTap;
  final bool isCompleted;
  final String exerciseName;
  final String weight;
  final String reps;
  final String sets;
  void Function(bool?)? onCheckboxChanged;
  void Function(BuildContext)? onDeletePressed;
  ExerciseTile({
    super.key,
    required this.onTap,
    required this.isCompleted,
    required this.exerciseName,
    required this.weight,
    required this.reps,
    required this.sets,
    required this.onCheckboxChanged,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              // delete option
              SlidableAction(
                onPressed: onDeletePressed,
                backgroundColor: Colors.red.shade400,
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(12),
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.only(top: 20, bottom: 15, left: 10),
            decoration: BoxDecoration(
              color: isCompleted ? Colors.greenAccent : Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  exerciseName.toUpperCase(),
                  style: TextStyle(
                    color: isCompleted ? Colors.white : Colors.grey[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              subtitle: Row(
                children: [
                  // weight
                  Chip(
                    label: Text(
                      '${weight}lb',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor:
                        isCompleted ? Colors.purple : Colors.grey[700],
                  ),

                  const SizedBox(width: 4),

                  // reps
                  Chip(
                    label: Text(
                      '$reps reps',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor:
                        isCompleted ? Colors.pink : Colors.grey[700],
                  ),

                  const SizedBox(width: 4),

                  // sets
                  Chip(
                    label: Text(
                      '$sets sets',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor:
                        isCompleted ? Colors.lightBlue : Colors.grey[700],
                  )
                ],
              ),
              trailing: Checkbox(
                value: isCompleted,
                onChanged: (val) {
                  onCheckboxChanged!(val);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
