import 'package:animate_do/animate_do.dart';
import 'package:audio_wave/audio_wave.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
//import 'package:sp_fitness_app/presentation/progress_screen/progress_screen.dart';
import 'package:sp_fitness_app/screens/home/home.dart';
import 'package:sp_fitness_app/shared/widgets/spacing.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sp_fitness_app/shared/widgets/custom_button.dart';
import 'package:sp_fitness_app/core/app_export.dart';
import 'package:sp_fitness_app/shared/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray50,
      body: SafeArea(
        child: Column(
          children: [
            VerticalSpace(height: 16),
            Container(
              width: size.width,
              margin: getMargin(right: 16, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 7,
                      bottom: 3,
                    ),
                    child: Text(
                      "Activity",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: ColorConstant.black900,
                        fontSize: getFontSize(
                          26.00829315185547,
                        ),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 1.00,
                      ),
                    ),
                  ),
                  CustomIconButton(
                    height: 38,
                    width: 38,
                    variant: IconButtonVariant.OutlineBluegray5099,
                    padding: IconButtonPadding.PaddingAll6,
                    child: IconButton(
                            onPressed: () {
                              // Takes us to Achievements Page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ),
                              );
                            },
                            icon: Image.asset('images/Trophy1.png'),
                            iconSize: 150,
                          ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home()),
                      );
                    },
                  ),
                ],
              ),
            ),
            VerticalSpace(height: 30),
            Padding(
              padding: getPadding(
                left: 16,
                right: 16,
              ),
              child: BounceInDown(
                child: DatePicker(
                  DateTime.now(),
                  height: getVerticalSize(100),
                  initialSelectedDate: DateTime.now(),
                  monthTextStyle: TextStyle(
                    color: ColorConstant.gray500,
                    fontSize: getFontSize(
                      11,
                    ),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  dayTextStyle: TextStyle(
                    color: ColorConstant.gray500,
                    fontSize: getFontSize(
                      11,
                    ),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  dateTextStyle: TextStyle(
                    color: ColorConstant.black900,
                    fontSize: getFontSize(
                      20,
                    ),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  selectionColor: ColorConstant.red500,
                  selectedTextColor: ColorConstant.whiteA700,
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      date = date;
                    });
                  },
                ),
              ),
            ),
            VerticalSpace(height: 16),
            Expanded(
              child: Container(
                width: size.width,
                child: SingleChildScrollView(
                  child: Container(
                    width: size.width,
                    margin: getMargin(left: 16, right: 16, bottom: 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: getVerticalSize(
                                  161.00,
                                ),
                                width: getHorizontalSize(
                                  164.00,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorConstant.whiteA700,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: getPadding(
                                        left: 15,
                                        top: 20,
                                        right: 15,
                                        bottom: 0,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Steps",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: ColorConstant.black900,
                                              fontSize: getFontSize(
                                                13.4857816696167,
                                              ),
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              height: 1.00,
                                            ),
                                          ),
                                          CustomButton(
                                            width: 30,
                                            text: "👟",
                                            margin: getMargin(
                                              all: 0,
                                            ),
                                            variant: ButtonVariant.FillGray101,
                                            shape: ButtonShape.RoundedBorder7,
                                            padding: ButtonPadding.PaddingAll5,
                                            fontStyle: ButtonFontStyle
                                                .RobotoRegular1734,
                                          ),
                                        ],
                                      ),
                                    ),
                                    VerticalSpace(height: 20),
                                    Container(
                                      width: getHorizontalSize(50),
                                      child: CircularPercentIndicator(
                                        radius: 40.0,
                                        lineWidth: 5.5,
                                        percent: .8,
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        center: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '1234',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: ColorConstant.black900,
                                                fontSize: getFontSize(
                                                  20,
                                                ),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              'steps',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: ColorConstant.gray500,
                                                fontSize: getFontSize(
                                                  11,
                                                ),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        backgroundColor: ColorConstant.gray100,
                                        progressColor:
                                            ColorConstant.red500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              VerticalSpace(height: 16),
                              Container(
                                height: getVerticalSize(
                                  97.00,
                                ),
                                width: getHorizontalSize(
                                  164.00,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorConstant.whiteA700,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: getPadding(
                                        left: 15,
                                        top: 10,
                                        right: 15,
                                        bottom: 0,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Workout Time ",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: ColorConstant.black900,
                                              fontSize: getFontSize(
                                                13.4857816696167,
                                              ),
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              height: 1.00,
                                            ),
                                          ),
                                          CustomButton(
                                            width: 30,
                                            text: "💪",
                                            margin: getMargin(
                                              all: 0,
                                            ),
                                            variant: ButtonVariant.FillLime50,
                                            shape: ButtonShape.RoundedBorder7,
                                            padding: ButtonPadding.PaddingAll5,
                                            fontStyle: ButtonFontStyle
                                                .RobotoRegular1734,
                                          ),
                                        ],
                                      ),
                                    ),
                                    VerticalSpace(height: 10),
                                    Container(
                                      padding: getPadding(left: 16, right: 16),
                                      child: Row(
                                        children: [
                                          Text(
                                            '42 ',
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: ColorConstant.black900,
                                              fontSize: getFontSize(
                                                20,
                                              ),
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding: getPadding(top: 5),
                                            child: Text(
                                              ' minutes',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: ColorConstant.gray500,
                                                fontSize: getFontSize(
                                                  11,
                                                ),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    VerticalSpace(height: 12),
                                  ],
                                ),
                              ),
                              VerticalSpace(height: 16),
                              Container(
                                // height: getVerticalSize(
                                //   161.00,
                                // ),
                                width: getHorizontalSize(
                                  164.00,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorConstant.whiteA700,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: getPadding(
                                        left: 15,
                                        top: 10,
                                        right: 15,
                                        bottom: 0,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Sleep",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: ColorConstant.black900,
                                              fontSize: getFontSize(
                                                13.4857816696167,
                                              ),
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              height: 1.00,
                                            ),
                                          ),
                                          CustomButton(
                                            width: 30,
                                            text: " 💤",
                                            margin: getMargin(
                                              all: 0,
                                            ),
                                            variant: ButtonVariant.FillGray101,
                                            shape: ButtonShape.RoundedBorder7,
                                            padding: ButtonPadding.PaddingAll5,
                                            fontStyle: ButtonFontStyle
                                                .RobotoRegular1734,
                                          ),
                                        ],
                                      ),
                                    ),
                                    VerticalSpace(height: 10),
                                    Container(
                                      child: AudioWave(
                                        height: getVerticalSize(60),
                                        width: getHorizontalSize(134),
                                        spacing: 8,
                                        alignment: 'bottom',
                                        animationLoop: 1,
                                        beatRate: Duration(milliseconds: 100),
                                        bars: [
                                          AudioWaveBar(
                                              heightFactor: 0.9,
                                              color: ColorConstant.purple900),
                                          AudioWaveBar(
                                              heightFactor: 0.6,
                                              color: ColorConstant.purple900),
                                          AudioWaveBar(
                                              heightFactor: 1.0,
                                              color: ColorConstant.purple900),
                                          AudioWaveBar(
                                              heightFactor: 0.5,
                                              color: ColorConstant.purple900),
                                          AudioWaveBar(
                                              heightFactor: 0.6,
                                              color: ColorConstant.purple900),
                                          AudioWaveBar(
                                              heightFactor: 0.4,
                                              color: ColorConstant.purple900),
                                        ],
                                      ),
                                   
                                   
                                    ),
                                    VerticalSpace(height: 5),
                                    Container(
                                      padding: getPadding(left: 16, right: 16),
                                      child: Row(
                                        children: [
                                          Text(
                                            '10.5',
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: ColorConstant.black900,
                                              fontSize: getFontSize(
                                                20,
                                              ),
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding: getPadding(top: 5),
                                            child: Text(
                                              ' hours',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: ColorConstant.gray500,
                                                fontSize: getFontSize(
                                                  11,
                                                ),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    VerticalSpace(height: 5),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                // height: getVerticalSize(
                                //   161.00,
                                // ),
                                width: getHorizontalSize(
                                  164.00,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorConstant.whiteA700,
                                ),

                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  elevation: 0,
                                  margin: EdgeInsets.all(0),
                                  color: ColorConstant.whiteA700,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        7.71,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: getPadding(
                                          left: 15,
                                          top: 18,
                                          right: 15,
                                          bottom: 0,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Heart Rate",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: ColorConstant.black900,
                                                fontSize: getFontSize(
                                                  13.4857816696167,
                                                ),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 1.00,
                                              ),
                                            ),
                                            CustomButton(
                                              width: 30,
                                              text: "❤️",
                                              margin: getMargin(
                                                all: 0,
                                              ),
                                              variant: ButtonVariant
                                                  .FillDeeporange50,
                                              shape: ButtonShape.RoundedBorder7,
                                              padding:
                                                  ButtonPadding.PaddingAll5,
                                              fontStyle: ButtonFontStyle
                                                  .RobotoRegular1734,
                                            ),
                                          ],
                                        ),
                                      ),
                                      VerticalSpace(height: 10),
                                      IconButton(
                            onPressed: () {
                              // Takes us to Achievements Page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ),
                              );
                            },
                            icon: Icon(Icons.heart_broken_rounded),
                            color: ColorConstant.red500,
                            iconSize: 150,
                          ),
                                      VerticalSpace(height: 9),
                                      Container(
                                        padding:
                                            getPadding(left: 16, right: 16),
                                        child: Row(
                                          children: [
                                            Text(
                                              '120',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: ColorConstant.black900,
                                                fontSize: getFontSize(
                                                  20,
                                                ),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(top: 5),
                                              child: Text(
                                                ' bmp',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: ColorConstant.gray500,
                                                  fontSize: getFontSize(
                                                    11,
                                                  ),
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      VerticalSpace(height: 9),
                                    ],
                                  ),
                                ),
                              ),
                              VerticalSpace(height: 16),
                              Container(
                                height: getVerticalSize(
                                  161.00,
                                ),
                                width: getHorizontalSize(
                                  164.00,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorConstant.whiteA700,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: getPadding(
                                        left: 15,
                                        top: 20,
                                        right: 15,
                                        bottom: 0,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Calories",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: ColorConstant.black900,
                                              fontSize: getFontSize(
                                                13.4857816696167,
                                              ),
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              height: 1.00,
                                            ),
                                          ),
                                          CustomButton(
                                            width: 30,
                                            text: "🔥",
                                            margin: getMargin(
                                              all: 0,
                                            ),
                                            variant: ButtonVariant.FillOrange50,
                                            shape: ButtonShape.RoundedBorder7,
                                            padding: ButtonPadding.PaddingAll5,
                                            fontStyle: ButtonFontStyle
                                                .RobotoRegular1734,
                                          ),
                                        ],
                                      ),
                                    ),
                                    VerticalSpace(height: 20),
                                    Container(
                                      width: getHorizontalSize(50),
                                      child: CircularPercentIndicator(
                                        radius: 40.0,
                                        lineWidth: 5.5,
                                        percent: .7,
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        center: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '990',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: ColorConstant.black900,
                                                fontSize: getFontSize(
                                                  20,
                                                ),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              'KCal',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: ColorConstant.gray500,
                                                fontSize: getFontSize(
                                                  11,
                                                ),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        backgroundColor: ColorConstant.gray100,
                                        progressColor:
                                            ColorConstant.red500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                             
                            ],
                          ),
                        ],
                      ),
                    ),
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
