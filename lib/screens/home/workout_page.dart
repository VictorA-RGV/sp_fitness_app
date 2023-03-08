import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_fitness_app/shared/exercise_tile.dart';
import '../../shared/my_textfield.dart';
import '../../shared/workoutdata.dart';

class WorkoutPage extends StatefulWidget {
  final String workoutName;
  const WorkoutPage({super.key, required this.workoutName});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  // tick off check box
  void checkBoxTicked(String workoutName, String exerciseName) {
    Provider.of<WorkoutData>(context, listen: false)
        .checkOffExercise(workoutName, exerciseName);
  }

  // text controllers
  final _newExerciseController = TextEditingController();
  final _weightController = TextEditingController();
  final _repsController = TextEditingController();
  final _setsController = TextEditingController();

  // create a new individual exercise
  void createNewExercise() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),

            // exercise name textfield
            MyTextField(
              controller: _newExerciseController,
              hintText: "New exercise name",
            ),
            const SizedBox(height: 10),

            // weight textfield
            MyTextField(
              controller: _weightController,
              hintText: "Weight (kg)",
            ),
            const SizedBox(height: 10),

            // reps name textfield
            MyTextField(
              controller: _repsController,
              hintText: "Reps",
            ),
            const SizedBox(height: 10),

            // sets name textfield
            MyTextField(
              controller: _setsController,
              hintText: "Sets",
            ),
          ],
        ),
        actions: [
          // save
          MaterialButton(
            onPressed: save,
            color: Colors.black,
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
          ),

          // cancel
          MaterialButton(
            onPressed: cancel,
            color: Colors.black,
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // save button pressed
  void save() {
    Provider.of<WorkoutData>(context, listen: false).addExercise(
      widget.workoutName,
      _newExerciseController.text,
      _weightController.text,
      _repsController.text,
      _setsController.text,
    );
    clear();
  }

  // cancel box
  void cancel() {
    clear();
  }

  // clear controllers and pop dialog
  void clear() {
    Navigator.pop(context);
    setState(() {
      _newExerciseController.clear();
    });
  }

  // delete exercise
  void deleteExercise(String workoutName, String exerciseName) {
    Provider.of<WorkoutData>(context, listen: false)
        .deleteExercise(workoutName, exerciseName);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text(widget.workoutName),
          backgroundColor: Colors.grey[900],
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewExercise,
          backgroundColor: Colors.black,
          child: const Icon(Icons.add),
        ),
        body: value.numberOfExercisesInWorkout(widget.workoutName) == 0
            ? Center(
                child: Text(
                  "Create a new exercise!",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                ),
              )
            : ListView.builder(
                itemCount: value.numberOfExercisesInWorkout(widget.workoutName),
                itemBuilder: (context, index) => ExerciseTile(
                  exerciseName: value
                      .getRelevantWorkout(widget.workoutName)
                      .exercises[index]
                      .name,
                  weight: value
                      .getRelevantWorkout(widget.workoutName)
                      .exercises[index]
                      .weight,
                  reps: value
                      .getRelevantWorkout(widget.workoutName)
                      .exercises[index]
                      .reps,
                  sets: value
                      .getRelevantWorkout(widget.workoutName)
                      .exercises[index]
                      .sets,
                  onTap: () => checkBoxTicked(
                    widget.workoutName,
                    value
                        .getRelevantWorkout(widget.workoutName)
                        .exercises[index]
                        .name,
                  ),
                  onCheckboxChanged: (val) => checkBoxTicked(
                    widget.workoutName,
                    value
                        .getRelevantWorkout(widget.workoutName)
                        .exercises[index]
                        .name,
                  ),
                  onDeletePressed: (context) => deleteExercise(
                    widget.workoutName,
                    value
                        .getRelevantWorkout(widget.workoutName)
                        .exercises[index]
                        .name,
                  ),
                  isCompleted: value
                      .getRelevantWorkout(widget.workoutName)
                      .exercises[index]
                      .isCompleted,
                ),
              ),
      ),
    );
  }
}
