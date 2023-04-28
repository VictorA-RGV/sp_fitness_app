//import 'package:audio_wave/audio_wave.dart';
import 'package:sp_fitness_app/core/app_export.dart';
import 'package:sp_fitness_app/screens/home/home.dart';
import 'package:sp_fitness_app/shared/widgets/custom_button.dart';
import 'package:sp_fitness_app/shared/widgets/spacing.dart';
//import 'package:sp_fitness_app/shared/widgets/common_image_view.dart';
import 'package:flutter/material.dart';
//import 'package:easy_localization/easy_localization.dart';

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //bool isRtl = true;
    return Scaffold(
      backgroundColor: ColorConstant.gray50,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: size.width,
                margin: getMargin(
                  left: 15,
                  top: 20,
                  bottom: 20,
                  right: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                        padding: getPadding(
                          bottom: 0,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => Home()),
                                (Route<dynamic> route) => false);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        )),
                    Padding(
                      padding: getPadding(
                        top: 3,
                      ),
                      child: Text(
                        "Summary",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(
                            15,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1.00,
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        bottom: 1,
                      ),
                      child: IconButton(
                            onPressed: () {
                              // Takes us to Achievements Page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SummaryScreen(),
                                ),
                              );
                            },
                            icon: Image.asset('images/Trophy1.png'),
                            iconSize: 150,
                          ),)
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: getPadding(
                          left: 15,
                          top: 0,
                          right: 15,
                        ),
                        child: Text(
                          "Week 1 or something",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              25,
                            ),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 1.00,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: getMargin(
                            left: 15,
                            top: 20,
                            right: 15,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                7.70,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstant.bluegray5099,
                                spreadRadius: getHorizontalSize(
                                  2.00,
                                ),
                                blurRadius: getHorizontalSize(
                                  2.00,
                                ),
                                offset: Offset(
                                  0,
                                  4,
                                ),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: getSize(
                                  62.00,
                                ),
                                width: getSize(
                                  62.00,
                                ),
                                margin: getMargin(
                                  left: 7,
                                  top: 7,
                                  bottom: 6,
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  elevation: 0,
                                  margin: EdgeInsets.all(0),
                                  color: ColorConstant.indigo50,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        7.70,
                                      ),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              7.70,
                                            ),
                                          ),
                                          child: IconButton(
                            onPressed: () {
                              // Takes us to Achievements Page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SummaryScreen(),
                                ),
                              );
                            },
                            icon: Image.asset('images/Trophy1.png'),
                            iconSize: 150,
                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              HorizontalSpace(width: 15),
                              Container(
                                margin: getMargin(
                                  left: 0,
                                  top: 20,
                                  bottom: 19,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Day 1 Workout",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.black900,
                                          fontSize: getFontSize(
                                            15,
                                          ),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 1.00,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        top: 5,
                                        right: 10,
                                      ),
                                      child: Text(
                                        "08:30 - 09:15",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.bluegray800,
                                          fontSize: getFontSize(
                                            13,
                                          ),
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w400,
                                          height: 1.00,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: double.infinity,
                          margin: getMargin(
                            left: 15,
                            top: 23,
                            right: 15,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                7.70,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstant.bluegray5099,
                                spreadRadius: getHorizontalSize(
                                  2.00,
                                ),
                                blurRadius: getHorizontalSize(
                                  2.00,
                                ),
                                offset: Offset(
                                  0,
                                  4,
                                ),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: getPadding(
                                  left: 23,
                                  top: 24,
                                  right: 23,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: 1,
                                        bottom: 1,
                                      ),
                                      child: Text(
                                        "00:45:15",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.black900,
                                          fontSize: getFontSize(
                                            19,
                                          ),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 1.00,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 0,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: getPadding(
                                              bottom: 2,
                                            ),
                                            child: Text(
                                              "164 ",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: ColorConstant.black900,
                                                fontSize: getFontSize(
                                                  19,
                                                ),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 1.00,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: getPadding(
                                              left: 0,
                                              top: 9,
                                            ),
                                            child: Text(
                                              " bmp",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color:
                                                    ColorConstant.bluegray800,
                                                fontSize: getFontSize(
                                                  11,
                                                ),
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w400,
                                                height: 1.00,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 23,
                                  top: 5,
                                  right: 23,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        bottom: 2,
                                      ),
                                      child: Text(
                                        "Total time",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.bluegray800,
                                          fontSize: getFontSize(
                                            13,
                                          ),
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w400,
                                          height: 1.00,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 0,
                                        top: 2,
                                      ),
                                      child: Text(
                                        "Avg Heart Rate",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.bluegray800,
                                          fontSize: getFontSize(
                                            13,
                                          ),
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w400,
                                          height: 1.00,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 23,
                                  top: 26,
                                  right: 23,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            bottom: 1,
                                          ),
                                          child: Text(
                                            "617 ",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: ColorConstant.black900,
                                              fontSize: getFontSize(
                                                19,
                                              ),
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              height: 1.00,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 0,
                                            top: 8,
                                          ),
                                          child: Text(
                                            " Kcal",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: ColorConstant.bluegray800,
                                              fontSize: getFontSize(
                                                11,
                                              ),
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 1.00,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 0,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: getPadding(
                                              bottom: 1,
                                            ),
                                            child: Text(
                                              "640",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: ColorConstant.black900,
                                                fontSize: getFontSize(
                                                  19,
                                                ),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 1.00,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: getPadding(
                                              left: 0,
                                              top: 8,
                                            ),
                                            child: Text(
                                              " Kcal",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color:
                                                    ColorConstant.bluegray800,
                                                fontSize: getFontSize(
                                                  11,
                                                ),
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w400,
                                                height: 1.00,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 23,
                                  top: 7,
                                  right: 23,
                                  bottom: 27,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      "Active Calories",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: ColorConstant.bluegray800,
                                        fontSize: getFontSize(
                                          13,
                                        ),
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w400,
                                        height: 1.00,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 0,
                                      ),
                                      child: Text(
                                        "Total Calories",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.bluegray800,
                                          fontSize: getFontSize(
                                            13,
                                          ),
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w400,
                                          height: 1.00,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: double.infinity,
                          margin: getMargin(
                            left: 15,
                            top: 23,
                            right: 15,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                7.70,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstant.bluegray5099,
                                spreadRadius: getHorizontalSize(
                                  2.00,
                                ),
                                blurRadius: getHorizontalSize(
                                  2.00,
                                ),
                                offset: Offset(
                                  0,
                                  4,
                                ),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: getPadding(
                                  left: 23,
                                  top: 27,
                                  right: 23,
                                ),
                                child: Text(
                                  "Heart Rate",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      15,
                                    ),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 1.00,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: getPadding(
                                    left: 22,
                                    top: 19,
                                    right: 22,
                                    bottom: 22,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        margin: getMargin(
                                          left: 7,
                                          top: 2,
                                          bottom: 1,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "180",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color:
                                                      ColorConstant.bluegray800,
                                                  fontSize: getFontSize(
                                                    13,
                                                  ),
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.00,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(
                                                top: 94,
                                                right: 7,
                                              ),
                                              child: Text(
                                                "50",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color:
                                                      ColorConstant.bluegray800,
                                                  fontSize: getFontSize(
                                                    13,
                                                  ),
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.00,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: getVerticalSize(
                                          124.00,
                                        ),
                                        width: getHorizontalSize(
                                          238.00,
                                        ),
                                        margin: getMargin(
                                            left:  0 ,
                                            right:  8),
                                        child: Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: getPadding(left: 10),
                                                child: IconButton(
                            onPressed: () {
                              // Takes us to Achievements Page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SummaryScreen(),
                                ),
                              );
                            },
                            icon: Image.asset('images/Trophy1.png'),
                            iconSize: 150,
                          ),
                                            ),)
                                            
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomButton(
                        width: 345,
                        text: "Save Workout",
                        margin: getMargin(
                          left: 15,
                          top: 70,
                          right: 14,
                          bottom: 20,
                        ),
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => Home()),
                              (Route<dynamic> route) => false);
                        },
                        variant: ButtonVariant.OutlineDeeporange500331_2,
                        fontStyle: ButtonFontStyle.PoppinsMedium16,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}