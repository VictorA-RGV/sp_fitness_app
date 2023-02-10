import 'package:flutter/material.dart';
import 'package:sp_fitness_app/services/auth.dart';
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
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    String gender = "";
    String error = "";
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('HomePage of app'),
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
                  },
                  child: const Text('Next'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    gender = "Female";
                  },
                  child: const Text('Next'),
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Choose your Gender'),
                  validator: (value) => value!.isEmpty ? 'Enter gender' : null,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
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
                                builder: (context) =>
                                    Weight(widget.age, gender)));
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
