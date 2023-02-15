import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Strength_Level extends StatelessWidget {
  @override

   int selection = 0;
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
            backgroundColor: Colors.transparent,
            bottomOpacity: 0.0,
            elevation: 0.0,
            leading: const BackButton(
              color: Colors.blueGrey,
              key: Key('Strength-back-button'),
            )),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Text(
                  "Strength Level",
                  key: Key("Strength-Title"),
                  style: TextStyle(
                      fontFamily: 'kollektif',
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      color: Colors.blueGrey[900]),
                ),
              ),
            ],
          ),
            SizedBox(
                height: 50, //hefight of button
                width: 250,
                child: ElevatedButton(
                    onPressed: () {

                      selection = 1;
                    },
                    key: Key('beginner-button'),
                    child: Text('Beginner'), //text inside button

                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide(color: Color(0xff4c748b)))),
                    ))),
                    Padding(padding: EdgeInsets.all(8)),
                    SizedBox(
                height: 50, //hefight of button
                width: 250,
                child: ElevatedButton(
                    onPressed: () {
                      selection = 2;
                    },
                    key: Key('intermediate-button'),
                    child: Text('Intermediate'), //text inside button

                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide(color: Color(0xff4c748b)))),
                    ))),
                    Padding(padding: EdgeInsets.all(8)),
                    SizedBox(
                height: 50, //hefight of button
                width: 250,
                child: ElevatedButton(
                    onPressed: () {

                      selection = 3;
                    },
                    key: Key('advanced-button'),
                    child: Text('Advanced'), //text inside button

                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide(color: Color(0xff4c748b)))),
                    ))),
                    Padding(padding: EdgeInsets.all(8)),
                    
                    
                    
                  
          ],
        ),
      ),
      
    );
  }
}
