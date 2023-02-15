import 'package:flutter/material.dart';
import 'package:sp_fitness_app/shared/constants.dart';
import 'package:sp_fitness_app/screens/RegistrationProcess/weight.dart';

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
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Gender Screen'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    gender = "Male";
                    print("Gender is male now");
                  },
                  child: const Text('Male'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    gender = "Female";
                    print("Gender is female now");
                  },
                  child: const Text('Female'),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (gender == 'Male' || gender == 'Female') {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Weight(widget.age, gender),
                          ),
                        );
                      });

                      if (gender == null || gender == "") {
                        setState(() {
                          error = 'Pick a gender';
                        });
                      }
                    }
                  },
                  child: const Text('Next'),
                ),
                SizedBox(
                  height: 15.0,
                  child: Text(error),
                )
              ],
            ),
          )),
    );
  }
}
