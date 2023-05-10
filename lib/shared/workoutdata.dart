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




//Stream<QuerySnapshot> userData = getUserData('currentUserId');

class WorkoutData extends ChangeNotifier {
  final db = HiveDatabase();

  List<Workout> _workouts = [];

  WorkoutData({required int frequency, required int userLevel}) {
    _initializeWorkouts(frequency, userLevel);
  }

  void _initializeWorkouts(int frequency, int userLevel) {
    Map<int, Map<String, String>> levelStartingWeights = {
      1: {'Squat': '45', 'Bench Press': '65', 'Barbell Row': '65', 'Overhead Press': '45', 'Deadlift': '95'},
      2: {'Squat': '95', 'Bench Press': '135', 'Barbell Row': '135', 'Overhead Press': '95', 'Deadlift': '185'},
      3: {'Squat': '135', 'Bench Press': '185', 'Barbell Row': '185', 'Overhead Press': '135', 'Deadlift': '225'},
    };

    Map<String, String> startingWeights = levelStartingWeights[userLevel]!;

    for (int i = 1; i <= frequency; i++) {
  Workout workout;
  if (i % 2 == 1) {
    workout = Workout(
      name: "Day $i",
      exercises: [
        Exercise(
          name: "Squat",
          weight: startingWeights['Squat']!,
          reps: "5",
          sets: "5",
        ),
        Exercise(
          name: "Bench Press",
          weight: startingWeights['Bench Press']!,
          reps: "5",
          sets: "5",
        ),
        Exercise(
          name: "Barbell Row",
          weight: startingWeights['Barbell Row']!,
          reps: "5",
          sets: "5",
        ),
      ],
    );
  } else {
    workout = Workout(
      name: "Day $i",
      exercises: [
        Exercise(
          name: "Squat",
          weight: startingWeights['Squat']!,
          reps: "5",
          sets: "5",
        ),
        Exercise(
          name: "Overhead Press",
          weight: startingWeights['Overhead Press']!,
          reps: "5",
          sets: "5",
        ),
        Exercise(
          name: "Deadlift",
          weight: startingWeights['Deadlift']!,
          reps: "5",
          sets: "5",
        ),
      ],
    );
  }
  _workouts.add(workout);
}}

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

  void completeWorkout(String workoutName) {
    Workout workout = getRelevantWorkout(workoutName);
    workout.exercises.forEach((exercise) {
      int currentWeight = int.parse(exercise.weight);
      int newWeight = currentWeight + 5;
      exercise.weight = newWeight.toString();
    });

    void uncheckExercise(String workoutName, String exerciseName) {
  // find the relevant exercise in the workout
    Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);

  // Set the isCompleted boolean to false
    relevantExercise.isCompleted = false;

   notifyListeners();
  // save in database
   db.saveToDatabase(_workouts);
  }

    notifyListeners();
    db.saveToDatabase(_workouts);
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

  void uncheckExercise(String workoutName, String name) {}
}
