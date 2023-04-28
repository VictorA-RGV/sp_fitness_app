import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sp_fitness_app/screens/Achivements/Trophy_Achieve.dart';
import 'package:sp_fitness_app/screens/home/friendProfile.dart';
import 'package:sp_fitness_app/screens/home/second_home.dart';

import 'package:sp_fitness_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:sp_fitness_app/shared/Achievement_database.dart';

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
          child: Column(
            children: [
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
                      padding: const EdgeInsets.only(left:8.0),
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
                          Padding(padding: EdgeInsets.only( left: 80.0)),
                          Expanded(
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
                                    "Workouts",
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
                            MaterialPageRoute(
                              builder: (context) => CurrencyScreen(),
                            ),
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
                            MaterialPageRoute(
                              builder: (context) => const SecondHomePage(),
                            ),
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
                              Image.asset('images/gym1.png', height: 80),
                              SizedBox(height: 10),
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
              )
            ],
          ),
        ),
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

    Reference ref =
        FirebaseStorage.instance.ref().child("${UserID}profilepic.jpg");

    await ref.putFile(File(image!.path));

    ref.getDownloadURL().then((value) async {
      setState(() {
        profilePicLink = value;
        currentUserDocRef.update({
          'ProfilePic': profilePicLink,
        });
      });
    });
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
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
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
                return Column(children: [
                  "${data.docs[0]['ProfilePic']}" == ""
                      ? const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/147/147133.png'),
                          radius: 100,
                        )
                      : CircleAvatar(
                          radius: 100,
                          backgroundImage:
                              NetworkImage("${data.docs[0]['ProfilePic']}")),
                  ElevatedButton(
                    onPressed: () {
                      String userID = "${data.docs[0].id}";
                      pickUploadProfilePic(userID);
                    },
                    child: const Text('upload Profile Pic'),
                  ),
                ]);
              },
            ),
            Padding(padding: EdgeInsets.only(bottom: 25)),
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
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Loading...');
                    }
                    // Get User Data
                    final data = snapshot.requireData;
                    return Stack(
                      children: [
                        // Text for the container below
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text("Username",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        // Container for Username. Will display the username
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                          child: Container(
                            width: 375,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Text("  Username placeholder",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
                          child: Text("Email",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
                          child: Container(
                            width: 375,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text("  ${data.docs[0]['email']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 100, 0, 0),
                          child: Text("Age",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 125, 0, 0),
                          child: Container(
                            width: 375,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text("  ${data.docs[0]['age']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 150, 0, 0),
                          child: Text("Gender",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 175, 0, 0),
                          child: Container(
                            width: 375,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text("  ${data.docs[0]['gender']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 200, 0, 0),
                          child: Text("Level",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 225, 0, 0),
                          child: Container(
                            width: 375,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text("  ${data.docs[0]['selection']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 250, 0, 0),
                          child: Text("Initial Weight",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 275, 0, 0),
                          child: Container(
                            width: 375,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text("  ${data.docs[0]['weight']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FriendsPage extends StatefulWidget {
  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  final TextEditingController _searchController = TextEditingController();
  List<QueryDocumentSnapshot> _searchResults = [];

  void _onSearch(String searchText) async {
    final List<QueryDocumentSnapshot> results = await FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: searchText)
        .get()
        .then((querySnapshot) => querySnapshot.docs);

    setState(() {
      _searchResults = results;
    });
  }

  void _addFriend(QueryDocumentSnapshot friend) async {
    // add current user to the list of friend requests of searched user.
    print("Friend User: " +
        friend['email']); // prints the person ur trying to add

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

    // We want friends to get a request
    // We feed them our current user email.
    // friend['requests'] <-- want our logged in user email to be put on here.
    // friend['requests']
    friend.reference.update({
      'requests':
          FieldValue.arrayUnion([userData['email']]) // might need the ! here
    });

    // We want friends to able to see our request on their requests
    // They should be able to accept or reject
    // If Accepted, add them to friends list.
    // If Rejected, get rid of request from requests list.
  }

  void acceptFriendRequest(String currentUserId, String friendEmail) async {
    final currentUserDocRef =
        FirebaseFirestore.instance.collection('Users').doc(currentUserId);

    final friendDocRef = FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: friendEmail);

    // Remove the friend's email from the current user's requests list
    currentUserDocRef.update({
      'requests': FieldValue.arrayRemove([friendEmail]),
    });

    // Add the friend's email to the current user's friends list
    currentUserDocRef.update({
      'friends': FieldValue.arrayUnion([friendEmail]),
    });

    // Get the friend's document reference
    final friendQuerySnapshot = await friendDocRef.get();
    final friendDoc = friendQuerySnapshot.docs.first;

    // Get the current user's email
    final currentUser = FirebaseAuth.instance.currentUser!;
    final currentUserEmail = currentUser.email;

    // Add the current user's email to the friend's friends list
    friendDoc.reference.update({
      'friends': FieldValue.arrayUnion([currentUserEmail]),
    });
  }

  void rejectFriendRequest(String currentUserId, String friendEmail) async {
    final currentUserDocRef =
        FirebaseFirestore.instance.collection('Users').doc(currentUserId);

    // Remove the friend's email from the current user's requests list
    currentUserDocRef.update({
      'requests': FieldValue.arrayRemove([friendEmail]),
    });
  }

  Widget _buildFriendListItem(QueryDocumentSnapshot friend) {
    return ListTile(
        leading: "${friend['ProfilePic']}" == ""
            ? const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/147/147133.png'),
                radius: 20,
              )
            : CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage("${friend['ProfilePic']}")),
        title: Text(friend['email']),
        subtitle: Text('Current weight: ${friend['weight']}'),
        trailing: SizedBox(
          width: 60,
          child: ElevatedButton.icon(
            onPressed: () => _addFriend(friend),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.all(8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => friendProfile(_searchController.text),
            ),
          );
        });
  }

  // Collects User's friend requests.
  // Took Andrews approach to this.
  // The stream builder takes care of accessing the data.
  // This is only getting the User's general data.
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> friendRequestsStream = FirebaseFirestore
        .instance
        .collection('Users')
        .where('uid', isEqualTo: _auth.getuid().toString())
        .snapshots();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            const Text(
              'Add friends',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _searchController,
              key: const Key('Friend-search'),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                hintText: 'Email, name, or username',
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              // Makes sure the textfield is not empty.
              validator: (value) => value!.isEmpty ? 'Enter an email' : null,
              // Changes variable to Textfield input
              onFieldSubmitted: (value) => _onSearch(_searchController.text),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: ((context, index) {
                  return _buildFriendListItem(_searchResults[index]);
                }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Current Friends',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // Renders Current Friends
            StreamBuilder<QuerySnapshot>(
              stream: friendRequestsStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  default:
                    final data = snapshot.requireData;
                    List<String> friendsList = List<String>.from(
                        // snapshot.data?.docs.first.data()!['requests']
                        data.docs[0]['friends']);
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: friendsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: const CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://twirpz.files.wordpress.com/2015/06/twitter-avi-gender-balanced-figure.png?w=640'),
                          ),
                          title: Text(friendsList[index]),
                        );
                      },
                    );
                }
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Friend Requests',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // Renders friends requests.
            StreamBuilder<QuerySnapshot>(
              stream: friendRequestsStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    final data = snapshot.requireData;
                    List<String> requestsList = List<String>.from(
                        // snapshot.data?.docs.first.data()!['requests']
                        data.docs[0]['requests']);
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: requestsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: const CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://twirpz.files.wordpress.com/2015/06/twitter-avi-gender-balanced-figure.png?w=640'),
                          ),
                          title: Text(requestsList[index]),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.check, color: Colors.green),
                                onPressed: () {
                                  // Accept friend request logic
                                  // If Accepted get rid of the request of that user and add them to the friends list.
                                  // The friend friend's list should get added with the user too
                                  //  acceptFriendRequest(userId, requestsList[index]); // Replace userId with the current user's ID
                                  acceptFriendRequest(
                                      data.docs[0].id, requestsList[index]);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.close, color: Colors.red),
                                onPressed: () {
                                  // Reject friend request logic
                                  // If Rejected get rid of the request of that user.
                                  // rejectFriendRequest(userId, requestsList[index]); // Replace userId with the current user's ID
                                  rejectFriendRequest(
                                      data.docs[0].id, requestsList[index]);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                }
              },
            )
          ],
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

// landing page for a longed in user
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
