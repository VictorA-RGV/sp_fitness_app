# ProgressPals - Gamified Fitness App

Welcome to the README.md file for ProgressPals, a gamified fitness app built with Flutter. This app is designed to help users stay consistent with their workouts and achieve their fitness goals while earning rewards and badges. It utilizes Firebase Firestore for data storage and retrieval, as well as the Hive package for local data management.

## Installation

To run the ProgressPals app locally, follow these steps:

1. Make sure you have Flutter and Dart installed on your machine. If not, you can install them by following the instructions at [Flutter.dev](https://flutter.dev).

2. Clone the repository to your local machine using Git.

```shell
git clone https://github.com/VictorA-RGV/sp_fitness_app.git
```

3. Navigate to the project directory.

```shell
cd sp_fitness_app
```

4. Install the project dependencies using Flutter's package manager, Pub.

```shell
flutter pub get
```

5. Create a new Firebase project and set up Firebase Firestore. Make sure to enable authentication and update the Firebase configuration in the project.

6. Update the Firebase configuration in the Flutter project. Open `lib/main.dart` and replace the following lines with your Firebase configuration:

```dart
// Replace with your own Firebase configuration
final firebaseConfig = Firebase.initializeApp(
  // ...
);
```

7. Run the app on an emulator or a connected device.

```shell
flutter run
```

## Usage

ProgressPals provides a user-friendly interface to track workouts, earn rewards, and maintain consistency. Here's a brief overview of the app's functionality:

- Upon launching the app, users will be prompted to log in or sign up using their preferred authentication method.

- Once logged in, users will see their dashboard, which displays their badges, current consistency progress, and a list of daily exercise tiles.

- The daily exercise tiles are generated based on a predefined exercise set or exercises added by the user. Each tile represents a specific exercise to be performed on that day.

- Users can tap on a daily exercise tile to view detailed instructions and perform the exercise. If the exercise is completed, the app will update the user's consistency progress and, if applicable, increase the weight by 5 lbs.

- The app keeps track of the user's consistency and rewards them with badges for reaching specific milestones.

- Users can also create their own exercises and add them to the app. These exercises are stored in a Hive box for easy retrieval and management.

## Contributing

Contributions to the ProgressPals project are welcome. If you would like to contribute, please follow these steps:

1. Fork the repository.

2. Create a new branch for your feature or bug fix.

3. Make your changes and ensure that the code passes all tests.

4. Commit your changes and push them to your forked repository.

5. Create a pull request, explaining your changes and their benefits.

Please note that while contributions are welcome, direct access to the main repository for editing is not available.

## License

ProgressPals is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute this code as per the terms of the license.

## Acknowledgements

- The Flutter team for providing a robust and versatile framework for building cross-platform applications.
- The authors and contributors of the Firebase and Hive packages for their invaluable work in simplifying data storage and management in Flutter.

## Contact

For any questions or inquiries, please contact [your-email@example.com](mailto:your-email@example.com).

---

Thank you for choosing ProgressPals as your gamified fitness app! We hope it helps you stay consistent with your workouts and achieve your fitness goals.
