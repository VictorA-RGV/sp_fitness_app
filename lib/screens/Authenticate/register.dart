import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_fitness_app/screens/Authenticate/sign_in.dart';
import 'package:sp_fitness_app/screens/wrapper.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/shared/constants.dart';
import 'package:sp_fitness_app/shared/loading.dart';

import '../../models/user.dart';

class Register extends StatefulWidget {
  // === This would be the variables register would be taking in ===
  int age;
  String gender;
  int weight;
  int height;
  int selection;

  // ===============================================================

  //const Register({super.key});

  // === This is how I was thinking of calling the constructor for the Register page ===========
  //
  Register(this.age, this.gender, this.weight, this.height, this.selection);
  //
  // ===========================================================================================

  //const Register({ age, gender, weight, height, selection, strength});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //txt field state
  String email = '';
  String password = '';
  String confirmPassword = '';
  String error = '';

  CollectionReference user = FirebaseFirestore.instance.collection('Users');
  @override
  Widget build(BuildContext context) {
    // print('age: ${widget.age}');
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: const Text('Register for App'),
              actions: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  icon: const Icon(Icons.person),
                  label: const Text('sign-in'),
                )
              ],
            ),
            body: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                // will be used to validate the form
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
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
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
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
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Confirm Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value != password) {
                          return 'Passwords do not match';
                        }
                        if (value!.length < 6) {
                          return 'Enter a password with 6+ chars long';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          confirmPassword = value;
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
                              .registerWithEmailAndPassword(email, password);
// gender, this.weight, this.height, this.selection
                          user.add({
                            'uid': result.uid,
                            'email': email,
                            'age': widget.age,
                            'gender': widget.gender,
                            'weight': widget.weight,
                            'height': widget.height,
                            'selection': widget.selection
                          }).then((value) => print('user added'));

                          if (result == null) {
                            setState(() {
                              error = 'please supply a valid email';
                              loading = false;
                            });
                          } else
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Wrapper()));
                        }
                      },
                      child: const Text('Register'),
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
