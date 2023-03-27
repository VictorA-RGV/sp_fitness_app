import 'package:flutter/material.dart';
import 'package:sp_fitness_app/screens/wrapper.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/shared/constants.dart';
import 'package:sp_fitness_app/shared/loading.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Creates obect to use Firebase Auth Service
  final AuthService _auth = AuthService();
  // ???
  final _formKey = GlobalKey<FormState>();
  // Determines if it should display the loading screen or the SignIn screen
  bool loading = false;

  //txt field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              // Turns the App Bar invisible
              elevation: 0.0,
              // Button used to go to the previous screen
              leading: const BackButton(
                color: Colors.blueGrey,
                key: Key('Strength-back-button'),
              ),
            ),
            body: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                // ???
                key: _formKey,
                child: Column(
                  children: [
                    //  Text that informs user the purpose of the screen
                    const Text(
                      'Sign in',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Padding
                    const SizedBox(
                      height: 20.0,
                    ),
                    // Textfield for user to input their email
                    TextFormField(
                      key: Key('email'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      // Makes sure the textfield is not empty.
                      validator: (value) =>
                          value!.isEmpty ? 'Enter an email' : null,
                      // Changes variable to Textfield input
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    // Padding
                    const SizedBox(
                      height: 20.0,
                    ),
                    // Textfield for user to input their password
                    TextFormField(
                      key: Key('password'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      // Hides password for user
                      obscureText: true,
                      // Checks if the password is at least 6 characters long.
                      validator: (value) => value!.length < 6
                          ? 'Enter a password with 6+ chars long'
                          : null,
                      // Changes variable to Textfield input
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    // Padding
                    const SizedBox(
                      height: 20.0,
                    ),
                    // Button to SignIn
                    ElevatedButton(
                      key: Key('sign-in-btn'),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          // Gets the result from Firebase Service SignIn attempt
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          // If SignIn attempt fails. Display error.
                          if (result == null) {
                            setState(() {
                              error =
                                  'Could not sign in with those credentials';
                              loading = false;
                            });
                            // If SignIn attempt succeeds. Brings us to Wrapper.
                          } else
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => Wrapper(),
                              ),
                            );
                        }
                      },
                      // Informs user the purpose of the button
                      child: const Text('Sign in'),
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
                    // Where the Error will be dispalyed
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
