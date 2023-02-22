import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/shared/constants.dart';
import 'package:sp_fitness_app/screens/RegistrationProcess/gender.dart';
import 'package:sp_fitness_app/screens/RegistrationProcess/strength.dart';

class Height extends StatefulWidget {
  int age;
  String gender;
  int weight;
  Height(this.age, this.gender, this.weight);

  @override
  _Height createState() => _Height();
}

// landing page for a longed in user
class _Height extends State<Height> {
  final AuthService _auth = AuthService();
  bool valIsInt = true;
  int height = 0;
  String error = "";

  @override
  Widget build(BuildContext context) {
    String error = "";
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Height Screen'),
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
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: textInputDecoration.copyWith(hintText: 'Height'),
                  onChanged: (value) async {
                    setState(() {
                      if (value.length > 0) {
                        height = int.parse(value);
                        print(height);
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
                  onPressed: valIsInt
                      ? () {
                          if (height > 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Strength(widget.age,
                                    widget.gender, widget.weight, height),
                              ),
                            );
                          } else if (height == null ||
                              height is double ||
                              height <= 0) {
                            setState(() {
                              error = 'Not a valid Height';
                            });
                          }
                        }
                      : null,
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
