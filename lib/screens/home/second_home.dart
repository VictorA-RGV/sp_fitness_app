import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'workout_page.dart';
<<<<<<< HEAD:lib/screens/home/second_home.dart


=======
// import 'package:sp_fitness_app/screens/Startup/Strength_Level.dart'; Does not exist
import 'package:sp_fitness_app/shared/ex.dart';
>>>>>>> 384028aac05b595dcf8302aceb8786d1fcdb16fe:lib/screens/home/second_home
import 'package:sp_fitness_app/shared/my_textfield.dart';
import 'package:sp_fitness_app/screens/Startup/get_started.dart';
import 'package:sp_fitness_app/screens/home/home.dart';
import 'package:sp_fitness_app/screens/home/workout_page.dart';
<<<<<<< HEAD:lib/screens/home/second_home.dart
import 'package:sp_fitness_app/screens/home/second_home.dart';
=======
import 'package:sp_fitness_app/screens/home/second_home';
>>>>>>> 384028aac05b595dcf8302aceb8786d1fcdb16fe:lib/screens/home/second_home
import 'package:sp_fitness_app/shared/workoutdata.dart';
import 'package:sp_fitness_app/shared/workout_tile.dart';


<<<<<<< HEAD:lib/screens/home/second_home.dart
class SecondHomePage extends StatefulWidget {
  const SecondHomePage({super.key});

=======
class HomePage extends StatefulWidget {
  const HomePage({super.key});
>>>>>>> 384028aac05b595dcf8302aceb8786d1fcdb16fe:lib/screens/home/second_home
  @override
  State<SecondHomePage> createState() => _SecondHomePage();
}

class _SecondHomePage extends State<SecondHomePage> {
  @override
  void initState() {
    super.initState();

    // initalize workout list
    Provider.of<WorkoutData>(context, listen: false).initializeWorkoutList();
  }

  // navigate to individual workout page
  void goToWorkoutPage(String workoutName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutPage(workoutName: workoutName),
      ),
    );
  }

  // text controllers
  final _newWorkoutNameController = TextEditingController();

  // add a new workout
  void createNewWorkout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        content: MyTextField(
          controller: _newWorkoutNameController,
          hintText: "New workout",
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

  // save workout
  void save() {
    Provider.of<WorkoutData>(context, listen: false)
        .addWorkout(_newWorkoutNameController.text);

    Navigator.pop(context);

    // go to new workout page
    goToWorkoutPage(_newWorkoutNameController.text);
  }

  // edit workout name
  void editWorkoutName(String currentWorkoutName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        content: MyTextField(
          controller: _newWorkoutNameController,
          hintText: "Edit workout name",
        ),
        actions: [
          // save
          MaterialButton(
            onPressed: () {
              String newWorkoutName = _newWorkoutNameController.text;
              Provider.of<WorkoutData>(context, listen: false).editWorkoutName(
                currentWorkoutName,
                newWorkoutName,
              );
              cancel();
            },
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

  // delete workout
  void deleteWorkout(String workoutName) {
    Provider.of<WorkoutData>(context, listen: false).deleteWorkout(workoutName);
  }

  // cancel
  void cancel() {
    Navigator.pop(context);
    clearControllers();
  }

  // clear controllers
  void clearControllers() {
    setState(() {
      _newWorkoutNameController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: createNewWorkout,
          backgroundColor: Colors.black,
          child: const Icon(Icons.add),
        ),
        body: ListView(
          children: [
            // HEAT MAP
            

            // WORKOUT LIST
            value.getWorkoutList().isEmpty
                ? Center(
                    child: Text(
                      "Create a new workout!",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.getWorkoutList().length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () =>
                          goToWorkoutPage(value.getWorkoutList()[index].name),
                      child: WorkoutTile(
                        workoutName: value.getWorkoutList()[index].name,
                        onPressed: () =>
                            goToWorkoutPage(value.getWorkoutList()[index].name),
                        onEditTapped: (context) =>
                            editWorkoutName(value.getWorkoutList()[index].name),
                        onDeleteTapped: (context) =>
                            deleteWorkout(value.getWorkoutList()[index].name),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
