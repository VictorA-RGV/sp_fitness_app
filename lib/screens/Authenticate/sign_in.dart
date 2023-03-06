import 'package:flutter/material.dart';
import 'package:sp_fitness_app/screens/Startup/get_started.dart';
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
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              // Color of Appbar
              backgroundColor: Colors.brown[400],
              // Hides App Bar from the user
              elevation: 0.0,
              // Text on App Bar
              title: const Text('Sign in to App'),
              actions: [
                // Creates Icon Button to go to Register Screen
                TextButton.icon(
                    onPressed: () {
                      // Brings us to the Get Started Screen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GetStarted()));
                    },
                    // Icon used
                    icon: const Icon(Icons.person),
                    // Text beside Icon
                    label: const Text('Register'))
              ],
            ),
            body: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 50.0),
                child: Form(
                  // ???
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      // Textfield to enter email
                      TextFormField(
                        // ???
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        // Makes sure the Textfield is not left empty
                        validator: (value) =>
                            value!.isEmpty ? 'Enter an email' : null,
                        onChanged: (value) {
                          setState(() {
                            // Sets variable email to the user input in the TextField
                            email = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      // Textfield to enter Password
                      TextFormField(
                        // ???
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        // Hides the input entered into the Textfield for safety reasons
                        obscureText: true,
                        // Checks if the password is complex enough (AKa: Has 6 characters at least)
                        validator: (value) => value!.length < 6
                            ? 'Enter a password with 6+ chars long'
                            : null,
                        onChanged: (value) {
                          setState(() {
                            // Sets Variable password to the user input in the TextField
                            password = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      // Sign In Button
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              // Load the Loading Screen
                              loading = true;
                            });
                            // Gets the result of SignIn Attempt
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);

                            // If result fails then remove Loading Screen and show the SignIn Screen
                            if (result == null) {
                              setState(() {
                                // Text used to inform the user that the SignIn attempt failed
                                error =
                                    'Could not sign in with those credentials';
                                // Undo the Loading Screen
                                loading = false;
                              });
                              // Brings us to the Wrapper which wiill bring us to the User HomeScreen
                            } else
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Wrapper()));
                          }
                        },
                        child: const Text('Sign in'),
                      ),
                      // Informs user that Sign In attempt has failed
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
