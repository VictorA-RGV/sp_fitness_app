import 'package:flutter/material.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/shared/constants.dart';
import 'package:sp_fitness_app/screens/RegistrationProcess/gender.dart';

class Age extends StatefulWidget {
  int userAge = 0;
  @override
  _Age createState() => _Age();
}

// landing page for a longed in user
class _Age extends State<Age> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    int age = 0;
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
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Age'),
                  validator: (value) => value!.isEmpty ? 'Enter age' : null,
                  onChanged: (value) {
                    setState(() {
                      age = int.parse(value);
                    });
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (age > 0 && age is int) {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Gender(age)));
                      });

                      if (age == null || age is double || age <= 0) {
                        setState(() {
                          error = 'Not a valid age';
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
