import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text("Get Started Screen"),
      // ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          // Container(
          //   padding: EdgeInsets.all(32.0),
          //   // Displays a logo at the top
          //   child: SvgPicture.asset(
          //     "images/logoipsum.svg",
          //     height: 50,
          //     width: 50,
          //   ),
          // ),
          Container(
            height: 180,
            width: 230,
            child: const Image(
              image: AssetImage('images/newlogo.png'),
              fit: BoxFit.contain,
            ),
          ),
          Container(
            // padding: EdgeInsets.all(32.0),
            padding: const EdgeInsets.only(
              left: 32.0,
              right: 32.0,
            ),
            // Gets the gif from online. Note: Don't search it. It makes no fucking sense
            child: Lottie.network(
                'https://assets3.lottiefiles.com/private_files/lf30_i5o0xxk6.json'),
          ),
          // Expanded(
          Container(
            padding: EdgeInsets.all(32.0),
            // Creates a button to lead to another screen to start the registeration process
            child: ElevatedButton(
              key: Key('get-started'),
              onPressed: () {
                // Brings you to the Age Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Age(),
                  ),
                );
              },
              // Affects the button appearance
              style: ElevatedButton.styleFrom(
                minimumSize: Size(327, 50),
                elevation: 0,
                // Color of button
                backgroundColor: Color.fromARGB(255, 255, 93, 81),
                // Shape of button
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              // Text of the button
              child: const Text(
                "Get Started",
                style: TextStyle(fontSize: 15, fontFamily: 'Averta'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 79),
            child: Row(
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontFamily: 'Averta'),
                ),
                GestureDetector(
                  onTap: () {
                    //handle tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign in',
                    key: Key('sign-in'),
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 255, 93, 81),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontFamily: 'Averta'),
                  ),
                ),
              ],
            ),
          ),

          // ****** Someone with a bigger screen please commentate the portion below ****** //
          // Expanded(
          //   child: RichText(
          //     key: const Key('rich-text'),
          //     text: TextSpan(
          //       text: 'Already have an account? ',
          //       style: DefaultTextStyle.of(context).style.copyWith(
          //           fontSize: 16,
          //           color: Colors.black,
          //           fontWeight: FontWeight.w600,
          //           decoration: TextDecoration.none,
          //           fontFamily: 'Roboto'),
          //       children: <TextSpan>[
          //         TextSpan(
          //           text: 'Sign in',
          //           recognizer: TapGestureRecognizer()
          //             ..onTap = () => Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                     builder: (context) => SignIn(),
          //                   ),
          //                 ),
          //           style: const TextStyle(
          //             fontSize: 12,
          //             color: Color.fromARGB(255, 255, 93, 81),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
