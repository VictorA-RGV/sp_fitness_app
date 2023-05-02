import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sp_fitness_app/screens/Achivements/Stats.dart';
import 'package:sp_fitness_app/screens/Achivements/Trophy_Achieve.dart';
import 'package:sp_fitness_app/screens/activity_screen/activity_screen.dart';
import 'package:sp_fitness_app/screens/home/friendProfile.dart';
import 'package:sp_fitness_app/screens/home/second_home.dart';
import 'package:sp_fitness_app/shared/constants.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:sp_fitness_app/shared/Achievement_database.dart';

import 'package:sp_fitness_app/screens/home/tab1.dart';
import 'package:sp_fitness_app/screens/home/tab2.dart' as Tab2;

import '../Achivements/tasksAndBadges.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //CollectionReference userI = FirebaseFirestore.instance.collection('Users');
  final Stream<QuerySnapshot> userData =
      FirebaseFirestore.instance.collection('Users').snapshots();

  @override
  Widget build(BuildContext context) {
    // Collects User Specific Data

    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  // Box used to make things look nice
                  Container(
                    height: 70,
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
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildUserInformation(),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                child: Text(
                                  'Let\'s check your activity',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          
                           SizedBox(
                              width: 50,
                              height: 50,
                              child: _buildUserProfilePic(),
                            ),
                          
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(8.0)),

              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.03),
                                spreadRadius: 10,
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                passCompletedWorkouts(),
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Workouts Completed",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.03),
                                spreadRadius: 10,
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "0",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Workouts In-Progress",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Where the buttons are
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Achievements Button
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          // Takes us to Achievements Page
                          Navigator.push(
                            context,
                            SlideRightRoute(page: CurrencyScreen()),
                          );
                        },
                        child: Container(
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
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('images/Trophy1.png', height: 100),
                              SizedBox(height: 10),
                              Text(
                                "Achievements",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    // Workout Button
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          // Takes us to  Worrkout Page
                          Navigator.push(
                            context,
                            SlideLeftRoute(page: SecondHomePage()),
                          );
                        },
                        child: Container(
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
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Image.asset('images/gym1.png', height: 80),
                              const SizedBox(height: 16),
                              Text(
                                "Workout",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// SECOND ROW OF STUFF
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
                          ]),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Takes us to Achievements Page
                                  Navigator.push(context,
                                      SlideUpRoute(page: SummaryScreen()));
                                },
                                icon: Icon(Icons.insights),
                                iconSize: 100,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: const [
                              Text("Statistics",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10.0,
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
                          ]),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Takes us to  Worrkout Page
                                  Navigator.push(
                                  context,
                                   MaterialPageRoute(
                                   builder: (context) =>  ActivityScreen(),
                                  ),
                                  );
                                },
                                icon: Image.asset('images/gym1.png'),
                                iconSize: 80,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: const [
                              Text(
                                "Activity",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ])),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color(0xffeef444c);
  String profilePicLink = "";

  void pickUploadProfilePic(String UserID) async {
    final currentUserDocRef =
        FirebaseFirestore.instance.collection('Users').doc(UserID);

    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
      imageQuality: 90,
    );

    if (image != null) {
      // Check if an image was actually selected
      Reference ref =
          FirebaseStorage.instance.ref().child("${UserID}profilepic.jpg");

    try {
      await ref.putFile(File(image.path));
    } catch (err) {
      print("Caught error: $err");
    }

      ref.getDownloadURL().then((value) async {
        setState(() {
          profilePicLink = value;
          currentUserDocRef.update({
            'ProfilePic': profilePicLink,
          });
        });
      });
    }
  }

  CollectionReference user = FirebaseFirestore.instance.collection('Users');
  final AuthService _auth = AuthService();
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //CollectionReference userI = FirebaseFirestore.instance.collection('Users');
  final Stream<QuerySnapshot> userData =
      FirebaseFirestore.instance.collection('Users').snapshots();
  // Collects User Specific Data
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> userData2 = FirebaseFirestore.instance
        .collection('Users')
        .where('uid', isEqualTo: _auth.getuid().toString())
        .snapshots();
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: userData2,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot,
                  ) {
                    // If an error occurs when attempting to establish a connection to firebase.
                    if (snapshot.hasError) {
                      return const Text('Something went wrong.');
                    }
                    // If connection between firebase and app is not established right away.
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Loading...');
                    }
                    // Get User Data
                    final data = snapshot.requireData;
                    return Stack(children: [
                      Container(
                        width: 375,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.07),
                              spreadRadius: 10,
                              blurRadius: 3,
                              // changes position of shadow
                            )
                          ],
                        ),
                      ),
                      Positioned(
                          top: 20,
                          left: 80,
                          child: "${data.docs[0]['ProfilePic']}" == ""
                              ? const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://cdn-icons-png.flaticon.com/512/147/147133.png'),
                                  radius: 100,
                                )
                              : CircleAvatar(
                                  radius: 100,
                                  backgroundImage: NetworkImage(
                                      "${data.docs[0]['ProfilePic']}"))),
                      Positioned(
                          left: 190,
                          top: 175,
                          child: RawMaterialButton(
                              onPressed: () {
                                String userID = "${data.docs[0].id}";
                                pickUploadProfilePic(userID);
                              },
                              padding: const EdgeInsets.all(15),
                              elevation: 2.0,
                              fillColor: Colors.blueAccent,
                              shape: const CircleBorder(),
                              child: const Icon(Icons.edit,
                                  size: 25, color: Colors.white))),
                    ]);
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 25)),
                Stack(
                  children: [
                    StreamBuilder<QuerySnapshot>(
                      stream: userData2,
                      builder: (
                        BuildContext context,
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
                        final data = snapshot.requireData;
                        return Stack(
                          children: [
                            Container(
                                width: 375,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.07),
                                      spreadRadius: 10,
                                      blurRadius: 3,
                                      // changes position of shadow
                                    )
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    const Text(
                                      "  Username",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      textAlign: TextAlign.left,
                                    ),
                                    // Container for Username. Will display the username
                                    const Text("  Username placeholder",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        )),
                                    const Text("  Email",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    Text("  ${data.docs[0]['email']}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    const Text("  Age",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    Text("  ${data.docs[0]['age']}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    const Text("  Gender",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    Text("  ${data.docs[0]['gender']}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    const Text("  Level",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    Text("  ${data.docs[0]['selection']}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    const Text("  Initial Weight",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    Text("  ${data.docs[0]['weight']}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20))
                                  ],
                                )),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 25)),
                Container(
                  width: 375,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.07),
                        spreadRadius: 10,
                        blurRadius: 3,
                        // changes position of shadow
                      )
                    ],
                  ),
                  child: Column(children: [
                    Text("Achivements Place Holder")
                    // Place achivements here or else
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}

class FriendsPage extends StatefulWidget {
  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  List<QueryDocumentSnapshot> _searchResults = [];
  bool _showSearchResults = false;

  void _onSearch(String searchText) async {
    final List<QueryDocumentSnapshot> results = await FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: searchText)
        .get()
        .then((querySnapshot) => querySnapshot.docs);

    bool hasResults =
        results.isNotEmpty; // check if there are any search results

    setState(() {
      _searchResults = results;
      _showSearchResults = _showSearchResults = hasResults;
    });
  }

  void _addFriend(QueryDocumentSnapshot friend) async {
    // add current user to the list of friend requests of searched user.
    // print("Friend User: " +
    //     friend['email']); // prints the person ur trying to add

    final user = FirebaseAuth.instance.currentUser!;

    final userDocument = await FirebaseFirestore.instance
        .collection("Users")
        .where("uid", isEqualTo: user.uid)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first;
      } else {
        return null;
      }
    });

    final userData = userDocument?.data();
    print("Current User: " + userData!['email']);

    friend.reference.update({
      'requests':
          FieldValue.arrayUnion([userData['email']]) // might need the ! here
    });
  }
Widget _buildFriendListItem(QueryDocumentSnapshot friend) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 0,
          offset: const Offset(0, 1),
        ),
      ],
      border: Border.all(
        // color: Colors.grey.shade300,
        color: Colors.transparent,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
    ),
    child: ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => friendProfile(_searchController.text),
          ),
        );
      },
      leading: "${friend['ProfilePic']}" == ""
          ? const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/147/147133.png'),
              radius: 20,
            )
          : CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage("${friend['ProfilePic']}")),
      title: Text(
        friend['email'],
        style: const TextStyle(fontFamily: 'Averta'),
      ),
      subtitle: Text(
        'Current weight: ${friend['weight']}',
        style: const TextStyle(fontFamily: 'Averta', color: Colors.grey),
      ),
      trailing: SizedBox(
        width: 60,
        child: ElevatedButton.icon(
          onPressed: () => _addFriend(friend),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 93, 81),
            padding: const EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          icon: const Icon(
            Icons.person,
            color: Colors.white,
            size: 20,
          ),
          label: const Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    ),
  );
}


  // Collects User's friend requests.
  // Took Andrews approach to this.
  // The stream builder takes care of accessing the data.
  // This is only getting the User's general data.
  final Stream<QuerySnapshot> friendRequestsStream = FirebaseFirestore.instance
      .collection('Users')
      .where('uid', isEqualTo: Tab2.initData())
      .snapshots();

  bool _isFriendsSelected = false;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      final AuthService _auth = AuthService();

    final Stream<QuerySnapshot> friendRequestsStream = FirebaseFirestore
        .instance
        .collection('Users')
        .where('uid', isEqualTo: _auth.getuid().toString())
        .snapshots();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Stack(
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add friends',
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Averta',
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _searchController,
                    key: const Key('Friend-search'),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[00],
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        // borderSide:
                        //     BorderSide(color: Colors.grey.shade300, width: 2.0),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        // borderSide:
                        //     BorderSide(color: Colors.grey.shade300, width: 2.0),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 126, 126, 126),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      hintText: 'Email, name, or username',
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 126, 126, 126),
                        fontFamily: 'Averta',
                      ),
                    ),
                    // Makes sure the textfield is not empty.
                    validator: (value) =>
                        value!.isEmpty ? 'Enter an email' : null,
                    // Changes variable to Textfield input
                    onFieldSubmitted: (value) =>
                        _onSearch(_searchController.text),
                  ),
                  // Friends + Request Button Render Logic.
                  if (!_showSearchResults)
                    SizedBox(
                      height: 0,
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: _searchResults.length,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 25.0),
                              child:
                                  _buildFriendListItem(_searchResults[index]),
                            );
                          }),
                        ),
                      ),
                    ),
                  if (_showSearchResults)
                    SizedBox(
                      height: 110,
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: _searchResults.length,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 25.0),
                              child:
                                  _buildFriendListItem(_searchResults[index]),
                            );
                          }),
                        ),
                      ),
                    ),
                  // 3RD BUTTON DESIGN
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: SizedBox(
                      // height: MediaQuery.of(context).size.height,
                      height: 520, // size of the pages
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Container(
                            // height: 50, DO NOT UNCOMMENT
                            width: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 93, 81),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: TabBar(
                                    unselectedLabelColor: Colors.white,
                                    labelColor: Colors.black,
                                    indicatorColor: Colors.white,
                                    indicatorWeight: 0, // 2 =  Original
                                    indicator: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    controller: tabController,
                                    tabs: const [
                                      Tab(
                                        // text: 'Friends',
                                        child: Text(
                                          'Friends',
                                          style: TextStyle(
                                            fontFamily: 'Averta',
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          'Requests',
                                          style:
                                              TextStyle(fontFamily: 'Averta'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                Tab1(),
                                Tab2.Tab2(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}

// landing page for a logged in user
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Fake comment for git
  final AuthService _auth = AuthService();

  // === Bottom navigation stuff ===
  int _selectedIndex = 0; // keeps track of current page index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ProfilePage(),
    FriendsPage(),
    SettingsPage(),
  ];
  // === End of bottom navigation stuff ===

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Maybe the color of the screen???
      // backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(color: Colors.blueGrey),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: const Icon(Icons.person, color: Colors.blueGrey),
            label: const Text(
              'logout',
              style: TextStyle(color: Colors.blueGrey),
            ),
          )
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget _buildUserInformation() {
  final AuthService _auth = AuthService();

  final Stream<QuerySnapshot> userData2 = FirebaseFirestore.instance
      .collection('Users')
      .where('uid', isEqualTo: _auth.getuid().toString())
      .snapshots();
  return
      // User information
      StreamBuilder<QuerySnapshot>(
    // ???
    stream: userData2,
    builder: (
      BuildContext context,
      // ???
      AsyncSnapshot<QuerySnapshot> snapshot,
    ) {
      try {
        // Get User Data
        final data = snapshot.requireData;
        return Column(
          children: [
            Text(
              "Hello, ${data.docs[0]['email']}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        );
      } catch (e) {
        return const CircularProgressIndicator();
      }
    },
  );
}

Widget _buildUserProfilePic() {
  final AuthService _auth = AuthService();

  final Stream<QuerySnapshot> userData2 = FirebaseFirestore.instance
      .collection('Users')
      .where('uid', isEqualTo: _auth.getuid().toString())
      .snapshots();
  return StreamBuilder<QuerySnapshot>(
    stream: userData2,
    builder: (
      BuildContext context,
      AsyncSnapshot<QuerySnapshot> snapshot,
    ) {
      try {
        // Get User Data
        final data = snapshot.requireData;
        return "${data.docs[0]['ProfilePic']}" == ""
            ? const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/147/147133.png',
                ),
                radius: 20,
              )
            : CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  "${data.docs[0]['ProfilePic']}",
                ),
              );
      } catch (e) {
        return const CircularProgressIndicator();
      }
    },
  );
}
