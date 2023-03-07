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
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: const BackButton(
                color: Colors.blueGrey,
                key: Key('Strength-back-button'),
              ),
            ),
            body: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'Sign in',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter an email' : null,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      obscureText: true,
                      validator: (value) => value!.length < 6
                          ? 'Enter a password with 6+ chars long'
                          : null,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);

                          if (result == null) {
                            setState(() {
                              error =
                                  'Could not sign in with those credentials';
                              loading = false;
                            });
                          } else
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => Wrapper(),
                              ),
                            );
                        }
                      },
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
