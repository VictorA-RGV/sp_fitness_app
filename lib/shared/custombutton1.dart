import 'package:flutter/material.dart';
import 'package:sp_fitness_app/core/app_export.dart';

class CustomButton1 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Key keyValue;

  CustomButton1(
      {required this.text, required this.onPressed, required this.keyValue});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: keyValue,
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontFamily: 'Averta')),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(327, 50),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 93, 81),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.onTap,
      this.width,
      this.margin,
      this.text});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  VoidCallback? onTap;

  double? width;

  EdgeInsetsGeometry? margin;

  String? text;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Container(
      margin: margin,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: getHorizontalSize(width ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
        ),
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll14:
        return getPadding(
          all: 14,
        );
      case ButtonPadding.PaddingAll9:
        return getPadding(
          all: 9,
        );
      case ButtonPadding.PaddingAll5:
        return getPadding(
          all: 5,
        );
      default:
        return getPadding(
          all: 18,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillWhiteA700:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineBlack9000a:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineIndigo50:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillDeeporange50:
        return ColorConstant.deepOrange50;
      case ButtonVariant.OutlineDeeporange500331_2:
        return ColorConstant.deepOrange501;
      case ButtonVariant.FillGray101:
        return ColorConstant.gray101;
      case ButtonVariant.FillLime50:
        return ColorConstant.lime50;
      case ButtonVariant.FillOrange50:
        return ColorConstant.orange50;
      case ButtonVariant.FillDeeporange501:
        return ColorConstant.deepOrange501;
      case ButtonVariant.OutlineDeeporange501:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineBlack9000a1_2:
        return ColorConstant.deepOrange501;
      case ButtonVariant.OutlineIndigo501_2:
      case ButtonVariant.OutlineDeeporange5011_2:
        return null;
      default:
        return ColorConstant.deepOrange501;
    }
  }

  _setBorder() {
    switch (variant) {
      case ButtonVariant.OutlineIndigo50:
        return Border.all(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            0.96,
          ),
        );
      case ButtonVariant.OutlineIndigo501_2:
        return Border.all(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            0.96,
          ),
        );
      case ButtonVariant.OutlineDeeporange501:
        return Border.all(
          color: ColorConstant.deepOrange501,
          width: getHorizontalSize(
            0.96,
          ),
        );
      case ButtonVariant.OutlineDeeporange5011_2:
        return Border.all(
          color: ColorConstant.deepOrange501,
          width: getHorizontalSize(
            0.96,
          ),
        );
      case ButtonVariant.OutlineBlack9000a1_2:
        return Border.all(
          color: ColorConstant.black9000a,
          width: getHorizontalSize(
            0.48,
          ),
        );
      case ButtonVariant.OutlineDeeporange50033:
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.OutlineBlack9000a:
      case ButtonVariant.FillDeeporange50:
      case ButtonVariant.OutlineDeeporange500331_2:
      case ButtonVariant.FillGray101:
      case ButtonVariant.FillLime50:
      case ButtonVariant.FillOrange50:
      case ButtonVariant.FillDeeporange501:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder7:
        return BorderRadius.circular(
          getHorizontalSize(
            7.70,
          ),
        );
      case ButtonShape.CircleBorder15:
        return BorderRadius.circular(
          getHorizontalSize(
            15.39,
          ),
        );
      case ButtonShape.RoundedBorder19:
        return BorderRadius.circular(
          getHorizontalSize(
            19.24,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            24.06,
          ),
        );
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case ButtonVariant.OutlineBlack9000a:
        return [
          BoxShadow(
            color: ColorConstant.black9000a,
            spreadRadius: getHorizontalSize(
              0.00,
            ),
            blurRadius: getHorizontalSize(
              10.00,
            ),
            offset: Offset(
              0,
              4.8868210315704346,
            ),
          )
        ];
      case ButtonVariant.OutlineDeeporange500331_2:
        return [
          BoxShadow(
            color: ColorConstant.deepOrange50033,
            spreadRadius: getHorizontalSize(
              0.00,
            ),
            blurRadius: getHorizontalSize(
              10.00,
            ),
            offset: Offset(
              0,
              5.775000095367432,
            ),
          )
        ];
      case ButtonVariant.OutlineBlack9000a1_2:
        return [
          BoxShadow(
            color: ColorConstant.black9000a,
            spreadRadius: getHorizontalSize(
              0.00,
            ),
            blurRadius: getHorizontalSize(
              10.00,
            ),
            offset: Offset(
              0,
              4.8902437686920166,
            ),
          )
        ];
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.OutlineIndigo50:
      case ButtonVariant.FillDeeporange50:
      case ButtonVariant.FillGray101:
      case ButtonVariant.FillLime50:
      case ButtonVariant.FillOrange50:
      case ButtonVariant.FillDeeporange501:
      case ButtonVariant.OutlineIndigo501_2:
      case ButtonVariant.OutlineDeeporange501:
      case ButtonVariant.OutlineDeeporange5011_2:
        return null;
      default:
        return [
          BoxShadow(
            color: ColorConstant.deepOrange50033,
            spreadRadius: getHorizontalSize(
              0.00,
            ),
            blurRadius: getHorizontalSize(
              10.00,
            ),
            offset: Offset(
              0,
              4.773642539978027,
            ),
          )
        ];
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.RobotoRegular2502:
        return TextStyle(
          color: ColorConstant.lime50,
          fontSize: getFontSize(
            25.02,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.RobotoRegular2502Black901:
        return TextStyle(
          color: ColorConstant.black901,
          fontSize: getFontSize(
            25.02,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.PoppinsExtraBold12:
        return TextStyle(
          color: ColorConstant.bluegray800,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w800,
        );
      case ButtonFontStyle.PoppinsSemiBold2598:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            25.98,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.RobotoRegular2887:
        return TextStyle(
          color: ColorConstant.black901,
          fontSize: getFontSize(
            28.87,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.PoppinsMedium1167:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            11.67,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.RobotoRegular1734:
        return TextStyle(
          color: ColorConstant.black901,
          fontSize: getFontSize(
            17.34,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.RobotoRegular1638:
        return TextStyle(
          color: ColorConstant.black901,
          fontSize: getFontSize(
            16.38,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.PoppinsMedium1155:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            11.55,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium1155Bluegray800:
        return TextStyle(
          color: ColorConstant.bluegray800,
          fontSize: getFontSize(
            11.55,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium1636Deeporange501:
        return TextStyle(
          color: ColorConstant.deepOrange501,
          fontSize: getFontSize(
            16.36,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium16:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium1635:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16.35,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium1638:
        return TextStyle(
          color: ColorConstant.deepOrange501,
          fontSize: getFontSize(
            16.38,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium1638WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16.38,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.RobotoRegular2695:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            26.95,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.PoppinsMedium1156:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            11.56,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium1349:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            13.49,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16.36,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder24,
  RoundedBorder7,
  CircleBorder15,
  RoundedBorder19,
}

enum ButtonPadding {
  PaddingAll18,
  PaddingAll14,
  PaddingAll9,
  PaddingAll5,
}

enum ButtonVariant {
  OutlineDeeporange50033,
  FillWhiteA700,
  OutlineBlack9000a,
  OutlineIndigo50,
  FillDeeporange50,
  OutlineDeeporange500331_2,
  FillGray101,
  FillLime50,
  FillOrange50,
  FillDeeporange501,
  OutlineIndigo501_2,
  OutlineDeeporange501,
  OutlineDeeporange5011_2,
  OutlineBlack9000a1_2,
}

enum ButtonFontStyle {
  PoppinsMedium1636,
  RobotoRegular2502,
  RobotoRegular2502Black901,
  PoppinsExtraBold12,
  PoppinsSemiBold2598,
  RobotoRegular2887,
  PoppinsMedium1167,
  RobotoRegular1734,
  RobotoRegular1638,
  PoppinsMedium1155,
  PoppinsMedium1155Bluegray800,
  PoppinsMedium1636Deeporange501,
  PoppinsMedium16,
  PoppinsMedium1635,
  PoppinsMedium1638,
  PoppinsMedium1638WhiteA700,
  RobotoRegular2695,
  PoppinsMedium1156,
  PoppinsMedium1349,
}
