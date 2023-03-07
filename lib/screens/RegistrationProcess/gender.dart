import 'package:flutter/material.dart';
import 'package:sp_fitness_app/shared/constants.dart';
import 'package:lottie/lottie.dart';
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
  String gender = "";
  String error = "";

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
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Gender',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              CustomButton1(
                text: 'Male',
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
              const SizedBox(
                height: 20.0,
              ),
              CustomButton1(
                text: 'Female',
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
              const SizedBox(
                height: 20.0,
              ),
              CustomButton1(
                text: 'Other',
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
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Container(), // puts our elevatedButton at the bottom.
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
