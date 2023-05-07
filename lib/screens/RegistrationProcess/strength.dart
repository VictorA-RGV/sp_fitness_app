import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/screens/Authenticate/register.dart';
import 'package:sp_fitness_app/shared/workoutdata.dart';

class Strength extends StatefulWidget {
  int age;
  String gender;
  double weight;
  String height;
  int frequency;
  
  Strength(this.age, this.gender, this.weight, this.height, this.frequency);
  

  

  @override
  _Strength createState() => _Strength();
}



// landing page for a longed in user
class _Strength extends State<Strength> {
  final AuthService _auth = AuthService();
 // final int days = getFrequency()
  // User choice
  
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
        // Turns the App Bar invisible
        elevation: 0.0,
        // Button used to go to the previous screen
        leading: const BackButton(
          color: Colors.blueGrey,
          key: Key('strength-back-button'),
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
                  // Text used to inform the user of the purpose of the screen
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
              // Displays a gif
              child: Lottie.network(
                  'https://assets10.lottiefiles.com/packages/lf20_oMpCcG.json'),
            ),
            SizedBox(
              height: 50, // height of button
              width: 250,
              child: ElevatedButton(
                onPressed: ()  {
                  selection = 2;
                  print(widget.age);
                  print(widget.gender);
                  print(widget.height);
                  print(widget.weight);
                  print(selection);
                  // Brings us to Registration Screen with all our data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                       builder: (context) => Register(widget.age, widget.gender, widget.weight, widget.height, widget.frequency, selection),
                    ),
                  );
                },
                key: Key('beginner-button'),
                child: Text('Beginner'), // text inside button
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
                  print(selection);
                  // Brings us to Registration Screen with all our data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(widget.age, widget.gender, widget.weight, widget.height, widget.frequency, selection),
                    ),
                  );
                },
                key: Key('intermediate-button'),
                child: Text('Intermediate'), // text inside button
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
                  print(widget.age);
                  print(widget.gender);
                  print(widget.height);
                  print(widget.weight);
                  print(selection);
                  // Brings us to Registration Screen with all our data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(widget.age, widget.gender, widget.weight, widget.height, widget.frequency, selection),
                    ),
                  );
                },
                key: Key('advanced-button'),
                child: Text('Advanced'), // text inside button

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
