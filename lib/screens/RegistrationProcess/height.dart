import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sp_fitness_app/shared/constants.dart';
import 'package:sp_fitness_app/screens/RegistrationProcess/gender.dart';
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
  final AuthService _auth = AuthService();
  bool valIsString = true;
  String height = "";
  String error = "";

  int _currentFeet = 5;
  int _currentInches = 8;

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
              const Text(
                'Height',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,

                children: [
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
                    maxValue: 9,
                    value: _currentFeet,
                    onChanged: (value) async {
                      setState(() {
                        _currentFeet = value;
                      });
                    },
                  ),
                  const Text(
                    'ft',
                    style: TextStyle(
                      fontSize: 16,
                    ),
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
                    maxValue: 11,
                    value: _currentInches,
                    onChanged: (value) async {
                      setState(() {
                        _currentInches = value;
                      });
                    },
                  ),
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
                onPressed: valIsString
                    ? () {
                        height = '$_currentFeet ft $_currentInches in';
                        print(height);
                        // if (height > 0) {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => Strength(widget.age,
                        //           widget.gender, widget.weight, height),
                        //     ),
                        //   );
                        // } else if (height == null ||
                        //     height is double ||
                        //     height <= 0) {
                        //   setState(() {
                        //     error = 'Not a valid Height';
                        //   });
                        // }
                        if (height is String) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Strength(widget.age,
                                  widget.gender, widget.weight, height),
                            ),
                          );
                        } else {
                          setState(() {
                            error = 'Not a valid Height';
                          });
                        }
                      }
                    : null,
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
