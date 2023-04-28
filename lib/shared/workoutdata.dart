import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sp_fitness_app/models/date_time.dart';
import 'package:sp_fitness_app/screens/RegistrationProcess/frequency.dart';
import 'package:sp_fitness_app/screens/RegistrationProcess/strength.dart';
import 'package:sp_fitness_app/shared/exercise.dart';
import 'package:sp_fitness_app/shared/workout.dart';
import 'package:sp_fitness_app/shared/hive_database.dart';
import 'exercise.dart';
import 'workout.dart';
import 'package:sp_fitness_app/screens/home/home.dart';



// Get the user data for the current user
//Stream<QuerySnapshot> userData = getUserData('currentUserId');

class WorkoutData extends ChangeNotifier {

  final db = HiveDatabase();
  
  List<Workout> _workouts = [
    
    Workout(
      name: "Day 1",
      exercises: [
        Exercise(
          name: "Squat",
          weight: "45",
          reps: "5",
          sets: "5",
        ),
        Exercise(
          name: "Overhead Press",
          weight: "45",
          reps: "5",
          sets: "5",
        ),
        Exercise(
          name: "Bench Press",
          weight: "65",
          reps: "5",
          sets: "5",
        )
      ],
    ),

  ];

  /*List<String> suggestWorkouts(int frequency) {
  List<String> workouts = [];

  if (frequency == 1) {
    workouts.add('Day 1: Squat, Bench Press, Barbell Row');
  } else if (frequency == 2) {
    workouts.add('Day 1: Squat, Bench Press, Barbell Row');
    workouts.add('Day 2: Squat, Overhead Press, Deadlift');
  } else if (frequency == 3) {
    workouts.add('Day 1: Squat, Bench Press, Barbell Row');
    workouts.add('Day 2: Squat, Overhead Press, Deadlift');
    workouts.add('Day 3: Squat, Bench Press, Barbell Row');
  } else if (frequency == 4) {
    workouts.add('Day 1: Squat, Bench Press, Barbell Row');
    workouts.add('Day 2: Overhead Press, Deadlift');
    workouts.add('Day 3: Squat, Bench Press, Barbell Row');
    workouts.add('Day 4: Overhead Press, Deadlift');
  } else if (frequency == 5) {
    workouts.add('Day 1: Squat, Bench Press, Barbell Row');
    workouts.add('Day 2: Overhead Press, Deadlift');
    workouts.add('Day 3: Squat, Bench Press, Barbell Row');
    workouts.add('Day 4: Overhead Press, Deadlift');
    workouts.add('Day 5: Squat, Bench Press, Barbell Row');
  } else {
    workouts.add('Invalid frequency. Please choose a value between 1 and 5.');
  }

  return workouts;
} */


 // if there is workouts already in database, then make _workouts list that, otherwise it remains as default
  void initializeWorkoutList() {
    if (db.previousDataExists()) {
      _workouts = db.readFromDatabase();
    } else {
      db.saveToDatabase(_workouts);
    }

    // load heat map
    loadHeatMap();
  }

  String getStartDate() {
    return db.getStartDate();
  }

  // get the list of workouts
  List<Workout> getWorkoutList() {
    return _workouts;
  }

  // add a workout
  void addWorkout(String name) {
    // add a new workout with a blank list of exercises
    _workouts.add(Workout(name: name, exercises: []));

    notifyListeners();

    // save in database
    db.saveToDatabase(_workouts);
  }

  // edit workout name
  void editWorkoutName(String currentWorkoutName, String newWorkoutName) {
    Workout workout = getRelevantWorkout(currentWorkoutName);
    workout.name = newWorkoutName;

    notifyListeners();
    // save in database
    db.saveToDatabase(_workouts);
  }

  // delete workout
  void deleteWorkout(String workoutName) {
    Workout workout = getRelevantWorkout(workoutName);
    _workouts.remove(workout);

    notifyListeners();
    // save in database
    db.saveToDatabase(_workouts);
  }

  // delete an exercise
  void deleteExercise(String workoutName, String exerciseName) {
    Workout workout = getRelevantWorkout(workoutName);
    Exercise exercise = getRelevantExercise(workoutName, exerciseName);
    workout.exercises.remove(exercise);

    notifyListeners();
    // save in database
    db.saveToDatabase(_workouts);
  }

  // add an exercise
  void addExercise(String workoutName, String exerciseName, String weight,
      String reps, String sets) {
    // find the relevant workout
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    relevantWorkout.exercises.add(
      Exercise(name: exerciseName, weight: weight, reps: reps, sets: sets),
    );

    notifyListeners();
    // save in database
    db.saveToDatabase(_workouts);
  }

  // check off exercise
  void checkOffExercise(String workoutName, String exerciseName) {
    // find the relevant exercise in workout
    Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);

    // check off isCompleted boolean
    relevantExercise.isCompleted = !relevantExercise.isCompleted;

    notifyListeners();
    // save in database
    db.saveToDatabase(_workouts);

    // load heat map
    loadHeatMap();
  }

  // get length of a given workout
  int numberOfExercisesInWorkout(String workoutName) {
    // find the relevant workout
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    return relevantWorkout.exercises.length;
  }

  // return relevant workout object, given a workout name
  Workout getRelevantWorkout(String workoutName) {
    // find the relevant workout
    Workout relevantWorkout =
        _workouts.firstWhere((workout) => workout.name == workoutName);
    return relevantWorkout;
  }

  // return relevant exercise given workout & exercise name
  Exercise getRelevantExercise(String workoutName, String exerciseName) {
    // find the relevant workout
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    // then find the relevant exercise
    Exercise relevantExercise = relevantWorkout.exercises
        .firstWhere((exercise) => exercise.name == exerciseName);
    return relevantExercise;
  }

  /*

    HEAT MAP

  */

  Map<DateTime, int> heatMapDataSet = {};

  // load heat map
  void loadHeatMap() {
    DateTime startDate = createDateTimeObject(db.getStartDate());

    // count the number of days to load
    int daysInBetween = DateTime.now().difference(startDate).inDays;

    // go from start date to today and add each completion status to the dataset
    // "COMPLETION_STATUS_yyyymmdd" will be the key in the database
    for (int i = 0; i < daysInBetween + 1; i++) {
      String yyyymmdd = convertDateTimeToYYYYMMDD(
        startDate.add(Duration(days: i)),
      );

      // completion status = 0 or 1
      int completionStatus = db.getCompletionStatus(yyyymmdd);

      // split the datetime up like below so it doesn't worry about hours/mins/secs etc.

      // year
      int year = startDate.add(Duration(days: i)).year;

      // month
      int month = startDate.add(Duration(days: i)).month;

      // day
      int day = startDate.add(Duration(days: i)).day;

      final percentForEachDay = <DateTime, int>{
        DateTime(year, month, day): completionStatus,
      };

      heatMapDataSet.addEntries(percentForEachDay.entries);
      print(heatMapDataSet);
    }
  }
}
