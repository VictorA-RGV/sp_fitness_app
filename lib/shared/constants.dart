import 'package:flutter/material.dart';
//create constant designs to be reused in the app. You can use .copywith to edit the input decoration
const textInputDecoration = InputDecoration(
    
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.0)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.pink, width: 2.0)));

bool showDialogFlag = false;Widget showCustomDialog(BuildContext context) {
  if (showDialogFlag) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Title'),
          content: Text('Message'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                showDialogFlag = false;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  return SizedBox.shrink(); // or any other default widget you prefer
}
