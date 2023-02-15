import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/screens/Authenticate/register.dart';
import 'package:sp_fitness_app/screens/Authenticate/authenticate.dart';

class Strength extends StatefulWidget {
  int age;
  String gender;
  int weight;
  int height;
  Strength(this.age, this.gender, this.weight, this.height);

  @override
  _Strength createState() => _Strength();
}

// landing page for a longed in user
class _Strength extends State<Strength> {
  final AuthService _auth = AuthService();
  bool valIsInt = true;
  int height = 0;
  String error = "";

  int selection = 0;

  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: const BackButton(
          color: Colors.blueGrey,
          key: Key('Strength-back-button'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                  child: Text(
                    "Strength Level",
                    key: Key("Strength-Title"),
                    style: TextStyle(
                        fontFamily: 'kollektif',
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: Colors.blueGrey[900]),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50, //hefight of button
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  selection = 1;
                  // wanted to bypass Authenticate and go directly register
                  // we would send age, gender, weight, height, strength (selection) to register screen.

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Authenticate(),
                    ),
                  );
                },
                key: Key('beginner-button'),
                child: Text('Beginner'), //text inside button

                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(
                        color: Color(0xff4c748b),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            SizedBox(
              height: 50, //hefight of button
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  selection = 2;
                },
                key: Key('intermediate-button'),
                child: Text('Intermediate'), //text inside button

                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(
                        color: Color(0xff4c748b),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            SizedBox(
              height: 50, //hefight of button
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  selection = 3;
                },
                key: Key('advanced-button'),
                child: Text('Advanced'), //text inside button

                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(
                        color: Color(0xff4c748b),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
            ),
          ],
        ),
      ),
    );
  }
}
