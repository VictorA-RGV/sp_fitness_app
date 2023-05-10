import 'package:flutter/material.dart';
import 'package:sp_fitness_app/screens/RegistrationProcess/weight.dart';
import 'package:sp_fitness_app/shared/custombutton1.dart';

class Gender extends StatefulWidget {
  int age;

  Gender(this.age);

  @override
  _Gender createState() => _Gender();
}

// landing page for a longed in user
class _Gender extends State<Gender> {
  // Initializing Variables
  String gender = "";

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
          key: Key('gender-back-button'),
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
                'Gender',
                style: TextStyle(
                  fontFamily: 'Averta',
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
                keyValue: Key('male'),
                // Displays the choice
                // text: 'Male' ,
                text: 'Male',

                // Upon tapping the button. Transfer choice to variable and move to the next screen.
                onPressed: () async {
                  gender = "Male";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Weight(widget.age, gender),
                    ),
                  );
                },
              ),
              // Padding
              const SizedBox(
                height: 20.0,
              ),
              CustomButton1(
                keyValue: Key('female'),
                // Displays the choice
                text: 'Female',
                // Upon tapping the button. Transfer choice to variable and move to the next screen.
                onPressed: () async {
                  gender = "Female";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Weight(widget.age, gender),
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
                keyValue: Key('other'),
                text: 'Other',
                // Upon tapping the button. Transfer choice to variable and move to the next screen.
                onPressed: () async {
                  gender = "Other";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Weight(widget.age, gender),
                    ),
                  );
                },
              ),
              // Padding
              const SizedBox(
                height: 20.0,
              ),
              // ???
              Expanded(
                child: Container(), // puts our elevatedButton at the bottom.
              ),
            ],
          ),
        ),
      ),
    );
  }
}
