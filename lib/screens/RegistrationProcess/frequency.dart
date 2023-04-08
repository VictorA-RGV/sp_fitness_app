import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sp_fitness_app/screens/RegistrationProcess/strength.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/screens/Authenticate/register.dart';
import 'package:sp_fitness_app/shared/custombutton1.dart';

class Frequency extends StatefulWidget {
  int age;
  String gender;
  double weight;
  String height;


 Frequency(this.age, this.gender, this.weight, this.height, );

  @override
  _Frequency createState() => _Frequency();
}

// landing page for a longed in user
class _Frequency extends State<Frequency> {
  // Initializing Variables
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _frequencyController = TextEditingController();

 int frequency = 0;

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
          key: Key('frequency-back-button'),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              // Text used to inform the user of the Screen's purpose
              const Text(
                'How many times a week would you prefer to work out?',
                textAlign: TextAlign.center,
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
              // Creates a Button to select
              CustomButton1(
                keyValue: Key('1'),
                // Displays the choice
                text: 'One',
                // Upon tapping the button. Transfer choice to variable and move to the next screen.
                onPressed: () async {
                  frequency = 1;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Strength(widget.age, widget.gender, widget.weight, widget.height,frequency),
                    ),
                  );
                },
              ),
              // Padding
              const SizedBox(
                height: 20.0,
              ),
              CustomButton1(
                keyValue: Key('2'),
                // Displays the choice
                text: 'Two',
                // Upon tapping the button. Transfer choice to variable and move to the next screen.
                onPressed: () async {
                  frequency = 2;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Strength(widget.age, widget.gender, widget.weight, widget.height,frequency),
                    ),
                  );
                },
              ),
              // Padding
              const SizedBox(
                height: 20.0,
              ),
              CustomButton1(
                // Displays the choice
                keyValue: Key('3'),
                text: 'Three',
                // Upon tapping the button. Transfer choice to variable and move to the next screen.
                onPressed: () async {
                  frequency = 3;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Strength(widget.age, widget.gender, widget.weight, widget.height,frequency),
                    ),
                  );
                },
              ),
              // Padding
              const SizedBox(
                height: 20.0,
              ),
              CustomButton1(
                keyValue: Key('4'),
                // Displays the choice
                text: 'Four',
                // Upon tapping the button. Transfer choice to variable and move to the next screen.
                onPressed: () async {
                  frequency = 4;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Strength(widget.age, widget.gender, widget.weight, widget.height,frequency),
                    ),
                  );
                },
              ),const SizedBox(
                height: 20.0,
              ),
              CustomButton1(
                keyValue: Key('5'),
                // Displays the choice
                text: 'Five',
                // Upon tapping the button. Transfer choice to variable and move to the next screen.
                onPressed: () async {
                  frequency = 5;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Strength(widget.age, widget.gender, widget.weight, widget.height,frequency),
                    ),
                  );
                },
              ),
              // Padding
              const SizedBox(
                height: 20.0,
              ),]))));
              
              //CustomButton
  }}
  