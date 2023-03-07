import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/screens/Authenticate/register.dart';

class Strength extends StatefulWidget {
  int age;
  String gender;
  double weight;
  String height;
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
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                  child: Text(
                    "Strength Level",
                    key: Key("Strength-Title"),
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[900]),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(32.0),
              height: 270,
              child: Lottie.network(
                  'https://assets10.lottiefiles.com/packages/lf20_oMpCcG.json'),
            ),
            SizedBox(
              height: 50, //height of button
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  selection = 1;
                  // wanted to bypass Authenticate and go directly register
                  // we would send age, gender, weight, height, strength (selection) to register screen.

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(widget.age, widget.gender,
                          widget.weight, widget.height, selection),
                    ),
                  );
                },
                key: Key('beginner-button'),
                child: Text('Beginner'), //text inside button
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(327, 50),
                  elevation: 0,
                  backgroundColor: Color.fromARGB(255, 255, 93, 81),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
            ),
            SizedBox(
              height: 50, //hefight of button
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  selection = 2;
                  print(widget.age);
                  print(widget.gender);
                  print(widget.height);
                  print(widget.weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(widget.age, widget.gender,
                          widget.weight, widget.height, selection),
                    ),
                  );
                },
                key: Key('intermediate-button'),
                child: Text('Intermediate'), //text inside button
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(327, 50),
                  elevation: 0,
                  backgroundColor: Color.fromARGB(255, 255, 93, 81),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
            ),
            SizedBox(
              height: 50, //hefight of button
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  selection = 3;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(widget.age, widget.gender,
                          widget.weight, widget.height, selection),
                    ),
                  );
                },
                key: Key('advanced-button'),
                child: Text('Advanced'), //text inside button

                // style: ButtonStyle(
                //   backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //     RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(12.0),
                //       side: BorderSide(
                //         color: Color(0xff4c748b),
                //       ),
                //     ),
                //   ),
                // ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(327, 50),
                  elevation: 0,
                  backgroundColor: Color.fromARGB(255, 255, 93, 81),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
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
