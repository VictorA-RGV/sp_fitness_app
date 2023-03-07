import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sp_fitness_app/shared/custombutton1.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/shared/constants.dart';
import 'package:sp_fitness_app/screens/RegistrationProcess/gender.dart';

class Age extends StatefulWidget {
  @override
  _Age createState() => _Age();
}

// landing page for a longed in user
class _Age extends State<Age> {
  final AuthService _auth = AuthService();

  int _currentValue = 30; // default value for number picker.
  bool valIsInt = true;
  int age = 0;
  String error = "";

  @override
  Widget build(BuildContext context) {
    String error = "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackButton(
          color: Colors.blueGrey,
          key: Key('Strength-back-button'),
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
                minValue: 0,
                maxValue: 120,
                value: _currentValue,
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
              ElevatedButton(
                onPressed: valIsInt
                    ? () {
                        if (_currentValue > 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Gender(_currentValue),
                            ),
                          );
                        } else if (age == null || age is double || age <= 0) {
                          setState(
                            () {
                              error = 'Not a valid age';
                            },
                          );
                        }
                      }
                    : null,
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 15),
                ),
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
              // CustomButton1(text: 'hi', onPressed: ), // not quire sure how to pass the callback function onto our custom widget.
              SizedBox(
                height: 15.0,
                child: Text(error),
              )
            ],
          ),
        ),
      ),
    );
  }
}
