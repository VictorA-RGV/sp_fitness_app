import 'package:sp_fitness_app/core/app_export.dart';
import 'package:sp_fitness_app/shared/widgets/custom_button.dart';
import 'package:sp_fitness_app/shared/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// ignore: must_be_immutable
class StaggeredellipsefourItemWidget extends StatelessWidget {
  StaggeredellipsefourItemWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(
        161.00,
      ),
      width: getHorizontalSize(
        164.00,
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
                top: 20,
                right: 15,
                bottom: 0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    width: 30,
                    text: "👟",
                    margin: getMargin(
                      all: 0,
                    ),
                    variant: ButtonVariant.FillGray101,
                    shape: ButtonShape.RoundedBorder7,
                    padding: ButtonPadding.PaddingAll5,
                    fontStyle: ButtonFontStyle.RobotoRegular1734,
                  ),
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
                circularStrokeCap: CircularStrokeCap.round,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                progressColor: ColorConstant.deepOrange501,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
