import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sp_fitness_app/screens/RegistrationProcess/height.dart';
import 'package:sp_fitness_app/shared/constants.dart';
import 'package:sp_fitness_app/screens/Authenticate/register.dart';
import 'package:animated_weight_picker/animated_weight_picker.dart';
import 'package:lottie/lottie.dart';

class Weight extends StatefulWidget {
  int age;
  String gender;

  Weight(this.age, this.gender);

  @override
  _Weight createState() => _Weight();
}

// landing page for a longed in user
class _Weight extends State<Weight> {
  String _selectedWeightValue = '100'; // default value for number picker.
  double weight = 200;
  String error = "";
  bool valIsInt = false;

  @override
  Widget build(BuildContext context) {
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
                'Weight',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.all(32.0),
                height: 300,
                width: 300,
                child: Lottie.network(
                    'https://assets6.lottiefiles.com/packages/lf20_ocGoFt.json'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              AnimatedWeightPicker(
                min: 0,
                max: 300,
                suffixText: "lbs",
                dialColor: Colors.black,
                division: 0.1,
                suffixTextColor: const Color.fromARGB(255, 255, 93, 81),
                selectedValueColor: const Color.fromARGB(255, 255, 93, 81),
                onChange: (newValue) {
                  setState(() {
                    // _selectedWeightValue = newValue;
                    weight = double.parse(newValue);
                  });
                },
              ),
              Expanded(
                child: Container(), // puts our elevatedButton at the bottom.
              ),
              ElevatedButton(
                onPressed: () async {
                  if (weight > 0 && weight is double) {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Height(widget.age, widget.gender, weight),
                        ),
                      );
                    });

                    if (weight == null || weight <= 0) {
                      setState(() {
                        error = 'Not a valid weight';
                      });
                    }
                  }
                },
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
