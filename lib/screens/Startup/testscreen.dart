import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sp_fitness_app/screens/RegistrationProcess/strength.dart';
import 'package:sp_fitness_app/shared/ex.dart';
//import 'package:sp_fitness_app/screens/exercise/ex.dart';
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
            for (var i = 0; i < Names.length; i++)
              ElevatedButton(
                //var hi = Names.i;
                // inspect(Names[i]).toString(),
                child: Text(Names[i][0].toString()),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Names[i][1]),
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

List Names = [ ['testscreen',Testscreen()],[ 'workout', WorkoutPage(workoutName: 'Day 1')],
['exc', Excercise2()]

];
