import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sp_fitness_app/screens/RegistrationProcess/strength.dart';

class Height extends StatefulWidget {
  int age;
  String gender;
  double weight;
  Height(this.age, this.gender, this.weight);

  @override
  _Height createState() => _Height();
}

// landing page for a longed in user
class _Height extends State<Height> {
  String height = "";

  int _currentFeet = 5;
  int _currentInches = 8;

  @override
  Widget build(BuildContext context) {
    String error = "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // Turns the App Bar invisible
        elevation: 0.0,
        // Button used to go to the previous screen
        leading: const BackButton(
          color: Colors.blueGrey,
          key: Key('height-back-button'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: [
              // Text to inform the user of the purpse of the Screen
              const Text(
                'Height',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Padding
              const SizedBox(
                height: 40.0,
              ),
              Row(
                // Sets the alignment of the widgets
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  // Creates a widget for user to select their height in feet (Adds inches later)
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
                    // Sets the min and max feet of height possible
                    minValue: 3,
                    maxValue: 9,
                    // Sets the default feet
                    value: _currentFeet,
                    // Changes variable to the selected digit
                    onChanged: (value) async {
                      setState(() {
                        _currentFeet = value;
                      });
                    },
                  ),
                  // Informs user that this widget is for the feet in their height
                  const Text(
                    'ft',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  // The inches portion
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
                    // Sets the min and max number of inches
                    minValue: 0,
                    maxValue: 11,
                    // Sets the default inches
                    value: _currentInches,
                    // Changes variable to the selected digit
                    onChanged: (value) async {
                      setState(() {
                        _currentInches = value;
                      });
                    },
                  ),
                  // Informs user that this widget is for the inches in their height
                  const Text(
                    'in',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(), // puts our elevatedButton at the bottom.
              ),
              ElevatedButton(
                key: Key('height-next'),
                onPressed: () {
                  // Changes variable to hold data of user's height
                  height = '$_currentFeet ft $_currentInches in';
                  // Brings us to the enxt screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Strength(
                          widget.age, widget.gender, widget.weight, height),
                    ),
                  );
                },
                // Text to inform user the purpose of the button
                child: const Text('Next'),
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
            ],
          ),
        ),
      ),
    );
  }
}
