// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('SP Fitness App', () {
    late FlutterDriver
        driver; // added late to fix some issue (need to look more into it)

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    group('get started process', () {
      // ==== Happy Paths ====
      // Tests all around navigation of the registration proccess. (excludes actual registration testing)
      test('Back Button', () async {
        // runUnsynchronized is needed due to having infinite animations.
        // (flutter driver gets stuck waiting for no more pending frames, but the animation prevents this from happening)
        await driver.runUnsynchronized(() async {
          //get started screen
          final getStartedButtonFinder = find.byValueKey("get-started");
          await driver.tap(getStartedButtonFinder);

          //age screen
          final ageNextButtonFinder = find.byValueKey("age-next");
          await driver.tap(ageNextButtonFinder);

          //gender screen
          final otherButtonFinder = find.byValueKey("other");
          await driver.tap(otherButtonFinder);

          //weight screen
          final weightNextButtonFinder = find.byValueKey('weight-next');
          await driver.tap(weightNextButtonFinder);

          //height screen
          final heightNextButtonFinder = find.byValueKey('height-next');
          await driver.tap(heightNextButtonFinder);

          //strength screen
          final advancedButtonFinder = find.byValueKey('advanced-button');
          await driver.tap(advancedButtonFinder);

          // register screen
          final registerScreenFinder = find.byValueKey('register-screen');

          // we should expect to be in the register screen.
          expect(await driver.getText(registerScreenFinder), "Register");

          //register screen back to get started screen
          final registerBackFinder = find.byValueKey('register-back-button');
          await driver.tap(registerBackFinder);

          final strengthBackFinder = find.byValueKey('strength-back-button');
          await driver.tap(strengthBackFinder);

          final heightBackFinder = find.byValueKey('height-back-button');
          await driver.tap(heightBackFinder);

          final weightBackFinder = find.byValueKey('weight-back-button');
          await driver.tap(weightBackFinder);

          final genderBackFinder = find.byValueKey('gender-back-button');
          await driver.tap(genderBackFinder);

          final ageBackFinder = find.byValueKey('age-back-button');
          await driver.tap(ageBackFinder);

          // we should expect to be back in the get started screen.
          // doing this by seeing if the sign in text is present.
          final signInFinder = find.byValueKey('sign-in');
          expect(await driver.getText(signInFinder), "Sign in");
        });
      });

      // Tests user sign in.
      test('Sign in', () async {
        await driver.runUnsynchronized(() async {
          // get started screen
          final signInFinder = find.byValueKey('sign-in');
          await driver.tap(signInFinder);

          // sign in screen
          final emailFieldFinder = find.byValueKey('email');
          await driver.tap(emailFieldFinder);
          await driver.enterText('joja@gmail.com');

          final passwordFieldFinder = find.byValueKey('password');
          await driver.tap(passwordFieldFinder);
          await driver.enterText('joja1234');

          final signInBtnFinder = find.byValueKey('sign-in-btn');
          await driver.tap(signInBtnFinder);

          // home screen
          // Plan is to expect to be on the home screen by finding a text/key from there.
          // I skipped this part for now since home screen is still a work in progress.

          // final homePageFinder = find.byValueKey('something something');
          // expect(await driver.getText(homePageFinder), "something something");

          // ^ would sort of look like this
        });
      });

      test('Registration', () {
        // TO DO. Not sure how to test sign ups without creating a new account everytime.
      });

      // ==== Sad Paths ====
      // test for invalid password on sign in. (ex. password is less than 6 characters)
      // test for invalid email on sign in. (ex. if its empty, if it doesnt exist in db)
      // test for invalid password on sign up.
      // test for invalid email on sign up. (i saw there was a package to see if an email is legit, could leave this for later)
      // test for unmatching passwords on sign up.
    }, skip: true); 
  });
}
