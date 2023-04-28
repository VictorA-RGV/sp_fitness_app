import 'package:flutter/material.dart';
import 'package:sp_fitness_app/core/app_export.dart';

// ignore: must_be_immutable
class BackBtn extends StatelessWidget {
  Color color;
  BackBtn({this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: getPadding(
          bottom: 0,
        ),
        child: InkWell(
          onTap: () {
            if (Navigator.canPop(context)) Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: color,
          ),
        ));
  }
}
