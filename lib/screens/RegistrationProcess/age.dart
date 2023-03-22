import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sp_fitness_app/shared/custombutton1.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/screens/RegistrationProcess/gender.dart';

class Age extends StatefulWidget {
  @override
  _Age createState() => _Age();
}

// landing page for a longed in user
class _Age extends State<Age> {
  // Creating an object to use firebase Auth Service
  final AuthService _auth = AuthService();
  // Initializing variables
  int _currentValue = 30; // default value for number picker.
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // Turns the App Bar invisible
        elevation: 0.0,
        // Button used to go to the previous screen
        leading: const BackButton(
          color: Colors.blueGrey,
          key: Key('age-back-button'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              // Text used to inform user of the screen's purpose
              const Text(
                'Age',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              // Widget used to select age value
              NumberPicker(
                selectedTextStyle: const TextStyle(
                  color: Color.fromARGB(255, 255, 93, 81),
                  fontSize: 16,
                  // fontWeight: FontWeight.bold
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  // fontWeight: FontWeight.bold
                ),
                // Sets the min and max age.
                minValue: 10,
                maxValue: 120,
                // Sets the default age
                value: _currentValue,
                // Changes variable to the selected digit
                onChanged: (value) async {
                  setState(
                    () {
                      _currentValue = value;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Container(), // puts our elevatedButton at the bottom.
              ),
              // Creation of button to go to next screen
              ElevatedButton(
                key: Key('age-next'),
                // Checks if the value entered is an integer
                onPressed: () {
                  if (_currentValue >= 0) {
                    // Brings us to the Gender Selection Screen while passing our data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Gender(_currentValue),
                      ),
                    );
                    // If age is invalid then we give an error
                  }
                },
                // Text of button
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 15),
                ),
                // Changes the apperance of the button
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(327, 50),
                  elevation: 0,
                  backgroundColor: Color.fromARGB(255, 255, 93, 81),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              // CustomButton1(text: 'hi', onPressed: ), // not sure how to pass the callback function onto our custom widget.
            ],
          ),
        ),
      ),
    );
  }
}
