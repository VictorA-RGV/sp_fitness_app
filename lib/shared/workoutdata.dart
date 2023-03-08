import 'package:flutter/material.dart';
import 'package:sp_fitness_app/shared/exercise.dart';
import 'package:sp_fitness_app/shared/workout.dart';
//import '../datetime/date_time.dart';
import 'exercise.dart';
import 'workout.dart';

class WorkoutData extends ChangeNotifier {
  
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


  void initializeWorkoutList() {
    _workouts = _workouts;
  }

  //get the list of workouts
  List<Workout> getWorkoutList() {
    return _workouts;
  }

  // add a workout
  void addWorkout(String name) {
    // add a new workout with a blank list of exercises
    _workouts.add(Workout(name: name, exercises: []));
    notifyListeners();
  }

  // edit workout name
  void editWorkoutName(String currentWorkoutName, String newWorkoutName) {
    Workout workout = getRelevantWorkout(currentWorkoutName);
    workout.name = newWorkoutName;
    notifyListeners();
  }

  // delete workout
  void deleteWorkout(String workoutName) {
    Workout workout = getRelevantWorkout(workoutName);
    _workouts.remove(workout);
    notifyListeners();
  }

  // delete an exercise
  void deleteExercise(String workoutName, String exerciseName) {
    Workout workout = getRelevantWorkout(workoutName);
    Exercise exercise = getRelevantExercise(workoutName, exerciseName);
    workout.exercises.remove(exercise);
    notifyListeners();
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
  }

  // check off exercise
  void checkOffExercise(String workoutName, String exerciseName) {
    // find the relevant exercise in workout
    Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);
    // check off isCompleted boolean
    relevantExercise.isCompleted = !relevantExercise.isCompleted;
    notifyListeners();

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
} 