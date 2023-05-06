import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sp_fitness_app/core/utils/Apptextbutton1.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';






class ExerciseTile extends StatefulWidget {
  void Function()? onTap;
  final bool isCompleted;
  final String exerciseName;
  final String weight;
  final String reps;
  final String sets;
  void Function(bool?)? onCheckboxChanged;
   final Function(bool?)? onCheckboxChangedWhenSetsComplete;
  void Function(BuildContext)? onDeletePressed;
  ExerciseTile({
    required this.exerciseName,
    required this.weight,
    required this.reps,
    required this.sets,
    required this.onCheckboxChanged,
    required this.onDeletePressed,
    this.onCheckboxChangedWhenSetsComplete,
    required this.isCompleted,
  });


  @override
  State<ExerciseTile> createState() => _ExerciseTileState();
}

class _ExerciseTileState extends State<ExerciseTile> {
  List<bool> buttonStates = [false, false, false, false, false];

  bool get areAllButtonsTrue => buttonStates.every((element) => element == true);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 10, top: 20),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: widget.onDeletePressed,
                backgroundColor: Colors.red.shade400,
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(12),
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
      widget.isCompleted ? Theme.of(context).primaryColor : Colors.grey[300]!,
      widget.isCompleted ? Theme.of(context).accentColor : Colors.grey[400]!,
    ],
              ),
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                  widget.exerciseName.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // weight
                  Chip(
                    label: Text(
                      '${widget.weight}lb',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    backgroundColor: Colors.purple,
                  ),
                  // reps
                  Chip(
                    label: Text(
                      '${widget.reps} reps',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    backgroundColor: Colors.pink,
                  ),
                  // sets
                  Chip(
                    label: Text(
                      '${widget.sets} sets',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    backgroundColor: Colors.lightBlue,
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: AppTextButton1(
                      isTapped: buttonStates[index],
                      onTap: () {
                        setState(() {
                          buttonStates[index] = !buttonStates[index];
                          if (!areAllButtonsTrue && widget.isCompleted) {
                            widget.onCheckboxChanged!(false);
                          }
                        });
                      },
                      title: 'Set ${index + 1}',
                      width: 65,
                      borderRadius: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
             Checkbox(
  value: widget.isCompleted,
  onChanged: (val) {
    if (areAllButtonsTrue) {
      widget.onCheckboxChangedWhenSetsComplete?.call(val);
    } else if (!areAllButtonsTrue && widget.isCompleted) {
      widget.onCheckboxChanged!(false);
    }
  },
  activeColor: widget.isCompleted ? Colors.green : Colors.grey[700],
  checkColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),
),
            ]),
          ),
        ),
      ),
    );
  }
}