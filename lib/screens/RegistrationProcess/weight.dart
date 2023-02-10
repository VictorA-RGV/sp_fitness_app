import 'package:flutter/material.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/shared/constants.dart';
import 'package:sp_fitness_app/screens/Authenticate/register.dart';

class Weight extends StatefulWidget {
  int age;
  String gender;
  Weight(this.age, this.gender);
  @override
  _Weight createState() => _Weight();
}

// landing page for a longed in user
class _Weight extends State<Weight> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    int weight = 0;
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
                      weight = int.parse(value);
                    });
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (weight > 0 && weight is int) {
                      setState(() {
                        // ************* This is quite troublesome. I need help here *****************
                      });

                      if (weight == null || weight <= 0) {
                        setState(() {
                          error = 'Not a valid weight';
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
