import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sp_fitness_app/screens/RegistrationProcess/gender.dart';
import 'package:sp_fitness_app/screens/Authenticate/sign_in.dart';
import 'package:sp_fitness_app/screens/RegistrationProcess/age.dart';

class GetStarted extends StatefulWidget {
  @override
  _GetStarted createState() => _GetStarted();
}

class _GetStarted extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Get Started Screen"),
      // ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Container(
            padding: EdgeInsets.all(32.0),
            child: SvgPicture.asset(
              "images/logoipsum.svg",
              height: 50,
              width: 50,
            ),
          ),
          Container(
            padding: EdgeInsets.all(32.0),
            child: Lottie.network(
                'https://assets3.lottiefiles.com/private_files/lf30_i5o0xxk6.json'),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(32.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add your button action here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Age()),
                  );
                },
                child: Text("Get Started"),
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
          ),
          Expanded(
              child: GestureDetector(
            onTap: () {
              // Your sign-in code here
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Age()),
              );
            },
            child: RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: DefaultTextStyle.of(context).style.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontFamily: 'Roboto'),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign in',
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn())),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color.fromARGB(255, 255, 93, 81),
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
