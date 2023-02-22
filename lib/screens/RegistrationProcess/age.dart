import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/shared/constants.dart';
import 'package:sp_fitness_app/screens/RegistrationProcess/gender.dart';

class Age extends StatefulWidget {
  @override
  _Age createState() => _Age();
}

// landing page for a longed in user
class _Age extends State<Age> {
  final AuthService _auth = AuthService();
  bool valIsInt = true;
  int age = 0;
  String error = "";
  @override
  Widget build(BuildContext context) {
    String error = "";
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Age Screen'),
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
                decoration: textInputDecoration.copyWith(hintText: 'Age'),
                onChanged: (value) async {
                  setState(() {
                    if (value.length > 0) {
                      age = int.parse(value);
                      print(age);
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
                        if (age > 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Gender(age),
                            ),
                          );
                        } else if (age == null || age is double || age <= 0) {
                          setState(() {
                            error = 'Not a valid age';
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
        ),
      ),
    );
  }
}
