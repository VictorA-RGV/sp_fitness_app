import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sp_fitness_app/screens/Startup/Strength_Level.dart';
import 'package:sp_fitness_app/screens/get_started.dart';


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
            
            for ( var i=0; i < Names.length; i++)
            
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
List Names = [['strength level',Strength_Level()], ['testscreen',Testscreen()],['getstarted', GetStarted()]];
