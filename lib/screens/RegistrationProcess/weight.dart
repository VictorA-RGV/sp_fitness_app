import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  int weight = 0;
  String error = "";
  bool valIsInt = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Weight Screen'),
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
                  decoration: textInputDecoration.copyWith(hintText: 'Weight'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) => value!.isEmpty ? 'Enter Weight' : null,
                  onChanged: (value) {
                    setState(() {
                      if (value.length > 0) {
                        weight = int.parse(value);
                        print(weight);
                        valIsInt = true;
                      } else {
                        valIsInt = false;
                      }
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
