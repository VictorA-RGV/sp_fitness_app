import 'package:flutter/material.dart';
import 'package:sp_fitness_app/core/app_export.dart';

// ignore: must_be_immutable
class HorizontalSpace extends StatelessWidget {
  double width;
  HorizontalSpace(
    {
      required this.width
    }
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getHorizontalSize(width),
    );
  }
}



// ignore: must_be_immutable
class VerticalSpace extends StatelessWidget {
  double height;
  VerticalSpace(
    {
      required this.height
    }
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getVerticalSize(height),
    );
  }
}


// ignore: must_be_immutable
class CustomDivider extends StatelessWidget {

   CustomDivider({
    Key? key,
   
    this.bottomPadding=10,
    this.topPadding=10
  }) : super(key: key);

  
  double topPadding;
  double bottomPadding;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: getMargin(
                               
     top: topPadding,
     bottom: bottomPadding
      ),
      color: ColorConstant.gray100,
     );
  }
}

