import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sp_fitness_app/screens/Achivements/achivements.dart';
import 'package:sp_fitness_app/screens/home/second_home.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sp_fitness_app/shared/custombutton1.dart';

// landing page for a longed in user
class Home extends StatelessWidget {
  // Setting up object to use the Auth Service of Firebase. (Mainly to Sign Out or transmit data to database)
  final AuthService _auth = AuthService();

  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  //CollectionReference userI = FirebaseFirestore.instance.collection('Users');
  final Stream<QuerySnapshot> userData =
      FirebaseFirestore.instance.collection('Users').snapshots();
  // Collects User Specific Data
  final Stream<QuerySnapshot> userData2 = FirebaseFirestore.instance
      .collection('Users')
      .where('uid', isEqualTo: initData())
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Maybe the color of the screen???
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
        title: const Text('', style: TextStyle(color: Colors.blueGrey),),
        
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: const Icon(Icons.person, color: Colors.blueGrey ),
            label: const Text('logout',style: TextStyle(color: Colors.blueGrey)),
          )
        ],
      ),
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Stack(
                children: [
                  // Box used to make things look nice
                  Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.03),
                              spreadRadius: 10,
                              blurRadius: 3,
                              // changes position of shadow
                            ),
                          ])),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    // User information
                    child: Container(
                      // Size of container
                      height: 63,
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      // ???
                      child: StreamBuilder<QuerySnapshot>(
                        // ???
                        stream: userData2,
                        builder: (
                          BuildContext context,
                          // ???
                          AsyncSnapshot<QuerySnapshot> snapshot,
                        ) {
                          // If an error occurs when attempting to establish a connection to firebase.
                          if (snapshot.hasError) {
                            return const Text('Something went wrong.');
                          }
                          // If connection between firebase and app is not established right away.
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Text('Loading...');
                          }
                          // Get User Data
                          // ???
                          final data = snapshot.requireData;
                          return Column(
                            children: [
                              Text("Hello, ${data.docs[0]['email']}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20))
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  // extra text
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                    child: Text(
                      'Let\'s check your activity',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  // User icon
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 340),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/147/147133.png'),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        width: 175,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.03),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ])),
                    const SizedBox(
                      width: 30.0,
                    ),
                    Container(
                        width: 175,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.03),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ])),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          SizedBox(
                            height: 20,
                          ),Padding(padding: EdgeInsets.all(5)),
                          Text("0",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),Padding(padding: EdgeInsets.all(4)),
                          Text("Workouts Completed",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center)
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          const Text("Workouts In-Progress",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center),
                              Padding(padding: EdgeInsets.all(5)),
                          Row(
                            children: const [
                              Text("0",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center),
                              Text("\tWorkouts",
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center)
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),

              // Where the buttons are
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Achivements Button
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                            width: 175,
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.03),
                                    spreadRadius: 10,
                                    blurRadius: 3,
                                    // changes position of shadow
                                  ),
                                ])),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                // Takes us to Achievements Page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Achivements(),
                                  ),
                                );
                              },
                              icon: Image.asset('images/Trophy.png'),
                              iconSize: 150,
                            ),
                            const Padding(padding: EdgeInsets.only(bottom: 150))
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: const [
                            Text("Achivements",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16))
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 25.0,
                    ),
                    //  Workout Button
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                            width: 175,
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.03),
                                    spreadRadius: 10,
                                    blurRadius: 3,
                                    // changes position of shadow
                                  ),
                                ])),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                // Takes us to  Worrkout Page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SecondHomePage(),
                                  ),
                                );
                              },
                              icon: Image.asset('images/gym.png'),
                              iconSize: 100,
                            ),
                            const Padding(
                                padding: EdgeInsets.only(
                              bottom: 170,
                            ))
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: const [
                            Text(
                              "Workout",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ));
  }
}

// Get the data properly
String initData() {
  final AuthService _auth = AuthService();
  return _auth.getuid().toString();
}