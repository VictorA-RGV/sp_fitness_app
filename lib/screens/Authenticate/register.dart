import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sp_fitness_app/screens/wrapper.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/shared/loading.dart';

class Register extends StatefulWidget {
  // === This would be the variables register would be taking in ===
  int age;
  String gender;
  double weight;
  String height;
  int selection;

  // Fake comment to trigger git

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
            // backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              bottomOpacity: 0.0,
              elevation: 0.0,
              leading: const BackButton(
                color: Colors.blueGrey,
                key: Key('register-back-button'),
              ),
            ),
            body: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                // will be used to validate the form
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'Register',
                      key: Key('register-screen'),
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
                        setState(
                          () {
                            email = value;
                          },
                        );
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
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
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
                        setState(
                          () {
                            confirmPassword = value;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child:
                          Container(), // puts our elevatedButton at the bottom.
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
                            'username':
                                "username", // added this in case we ever want to add a username
                            'ProfilePic': "", // Added this for the profile pic
                            'email': email,
                            'age': widget.age,
                            'gender': widget.gender,
                            'weight': widget.weight,
                            'height': widget.height,
                            'selection': widget.selection,
                            'requests': [],
                            'friends': [],
                            'badges': []
                          }).then((value) => print('user added'));

                          if (result == null) {
                            setState(() {
                              error = 'please supply a valid email';
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
                      child: const Text('Register'),
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
