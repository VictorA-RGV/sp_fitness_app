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
  State<ExerciseTile> createState() => _ExerciseTileState();
}

class _ExerciseTileState extends State<ExerciseTile> {
  bool buttonState = false;
  bool buttonState2 = false;
  bool buttonState3 = false;
  bool buttonState4 = false;
  bool buttonState5 = false;

  bool istapped = false;

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
              // delete option
              SlidableAction(
                onPressed: widget.onDeletePressed,
                backgroundColor: Colors.red.shade400,
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(12),
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.only(top: 20, bottom: 15, left: 10),
            decoration: BoxDecoration(
              color: widget.isCompleted ? Colors.greenAccent : Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              child: Column(
                children:[ Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  widget.exerciseName.toUpperCase(),
                  style: TextStyle(
                    color: widget.isCompleted ? Colors.white : Colors.grey[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
             
               Row(
                children: [
                  // weight
                  Chip(
                    label: Text(
                      '${widget.weight}lb',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor:
                        widget.isCompleted ? Colors.purple : Colors.grey[700],
                  ),

                  const SizedBox(width: 4),

                  // reps
                  Chip(
                    label: Text(
                      '${widget.reps} reps',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor:
                        widget.isCompleted ? Colors.pink : Colors.grey[700],
                  ),

                  const SizedBox(width: 4),

                  // sets
                  Chip(
                    label: Text(
                      '${widget.sets} sets',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor:
                        widget.isCompleted ? Colors.lightBlue : Colors.grey[700],
                  )
                ],
              ),

              Row(children: [
               // Text('line 215'),
                       // AppSpacerH(16),
                        Wrap(
                          spacing: 5 ,
                          children: [
                            AppTextButton1(

                            isTapped:  buttonState,
                              
                              onTap: (() {
                                print('tapped');
                               setState(() {
                                buttonState = !buttonState;

                                    
                              });
                              }),
                              title: 'Set 1',
                              
                              
                              width: 65 ,
                              borderRadius: 25,
                            ),
                            AppTextButton1(

                            isTapped:  buttonState2,
                              
                              onTap: (() {
                                print('tapped');
                               setState(() {
                                buttonState2 = !buttonState2;

                                    
                              });
                              }),
                              title: 'Set 2',
                              
                              
                              width: 65 ,
                              borderRadius: 25,
                            ),
                            AppTextButton1(

                            isTapped:  buttonState3,
                              
                              onTap: (() {
                                print('tapped');
                               setState(() {
                                buttonState3 = !buttonState3;

                                    
                              });
                              }),
                              title: 'Set 3',
                              
                              
                              width: 65 ,
                              borderRadius: 25,
                            ),
                            AppTextButton1(

                            isTapped:  buttonState4,
                              
                              onTap: (() {
                                print('tapped');
                               setState(() {
                                buttonState4 = !buttonState4;

                              });
                              }),
                              title: 'Set 4',
                              
                              
                              width: 65 ,
                              borderRadius: 25,
                            ),
                            AppTextButton1(

                            isTapped:  buttonState5,
                              
                              onTap: (() {
                                print('tapped');
                               setState(() {
                                buttonState5 = !buttonState5;

                                    
                              });
                              }),
                              title: 'Set 5',
                              
                              
                              width: 65 ,
                              borderRadius: 25,
                            ),
                          ],
                        ),
                        


              ],),
              
              
               Checkbox(
                value: widget.isCompleted,
                onChanged: (val) {
                  widget.onCheckboxChanged!(val);
                },
              ),
            
          ])),
          
        

        ),
       
      ),
    ));;
  }
}
