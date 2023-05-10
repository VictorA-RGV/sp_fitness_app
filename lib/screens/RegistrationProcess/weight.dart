import 'package:flutter/material.dart';
import 'package:sp_fitness_app/screens/RegistrationProcess/height.dart';
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
  // initializes variable
  double weight = 50; // This will be the default weight. Aka, the min.

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
          key: Key('weight-back-button'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: [
              // Text that tells the user the purpose of the screen
              const Text(
                'Weight',
                style: TextStyle(
                  fontFamily: 'Averta',
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
                // gif that is being used
                child: Lottie.network(
                    'https://assets6.lottiefiles.com/packages/lf20_ocGoFt.json'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              AnimatedWeightPicker(
                // Setting the min/max
                min: 50,
                max: 300,
                suffixText: "lbs",
                dialColor: Colors.black,
                division: 0.1,
                suffixTextColor: const Color.fromARGB(255, 255, 93, 81),
                selectedValueColor: const Color.fromARGB(255, 255, 93, 81),
                // Changes variable to the selected digit
                onChange: (newValue) {
                  setState(() {
                    weight = double.parse(newValue);
                  });
                },
              ),
              Expanded(
                child: Container(), // puts our elevatedButton at the bottom.
              ),
              ElevatedButton(
                // Brings us to the next screen
                key: Key('weight-next'),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Height(widget.age, widget.gender, weight),
                    ),
                  );
                },
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
                // Text to inform user of the purpose of the button
                child: const Text(
                  'Next',
                  style: TextStyle(fontFamily: 'Averta'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
