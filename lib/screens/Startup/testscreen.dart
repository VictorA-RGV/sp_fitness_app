import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
<<<<<<< HEAD

import 'package:sp_fitness_app/screens/RegistrationProcess/strength.dart';
=======
import 'package:sp_fitness_app/screens/Startup/get_started.dart'; // You can delete this when the import below is recreated or committed properly.
// import 'package:sp_fitness_app/screens/Startup/Strength_Level.dart'; // This does not exist
import 'package:sp_fitness_app/shared/ex.dart';
>>>>>>> 384028aac05b595dcf8302aceb8786d1fcdb16fe
import 'package:sp_fitness_app/shared/ex.dart';
import 'package:sp_fitness_app/screens/home/home.dart';
import 'package:sp_fitness_app/screens/home/workout_page.dart';
import 'package:sp_fitness_app/screens/home/second_home.dart';
import 'package:sp_fitness_app/screens/Authenticate/register.dart';


class Testscreen extends StatelessWidget {
  @override
  int count = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Testing Screen'),
            for (var i = 0; i < Names2.length; i++)
              ElevatedButton(
                //var hi = Names.i;
                // inspect(Names[i]).toString(),
                child: Text(Names2[i][0].toString()),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Names2[i][1]),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

// make a list of pages to be displayed
<<<<<<< HEAD

List Names = [ ['testscreen',Testscreen()],[ 'workout', WorkoutPage(workoutName: 'Day 1')],
['exc', Excercise2()]

=======
// Victor's Code ==============================
List Names2 = [
  ['testscreen', Testscreen()],
  ['getstarted', GetStarted()],
>>>>>>> 384028aac05b595dcf8302aceb8786d1fcdb16fe
];
// Adrian's Code ======================
// List Names = [['strength level',Strength_Level()], ['testscreen',Testscreen()],['getstarted', GetStarted()],[ 'workout', WorkoutPage(workoutName: 'Day 1')],
// ['exc', Excercise2()], ['secondhome',HomePage()]
// ];
// *** The import for this does not exist ***
// =========================
