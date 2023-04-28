import 'package:sp_fitness_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator});

  TextFormFieldShape? shape;

  TextFormFieldPadding? padding;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? isObscureText;

  TextInputAction? textInputAction;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: getHorizontalSize(width ?? 0),
      margin: margin,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder:OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.deepOrange501,
            width: 1.5,
          ),
        ),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.PoppinsMedium154:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            15.4,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case TextFormFieldFontStyle.OpenSans1346:
        return TextStyle(
          color: ColorConstant.bluegray800,
          fontSize: getFontSize(
            13.46,
          ),
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: ColorConstant.bluegray800,
          fontSize: getFontSize(
            13.47,
          ),
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w400,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      case TextFormFieldShape.RoundedBorder7:
        return BorderRadius.circular(
          getHorizontalSize(
            7.70,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            23.09,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.OutlineDeeporange501:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.deepOrange501,
            width: 0.96,
          ),
        );
      case TextFormFieldVariant.OutlineIndigo50:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.indigo50,
            width: 0.96,
          ),
        );
      case TextFormFieldVariant.OutlineGray300:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray300,
            width: 1.5,
          ),
        );
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case TextFormFieldVariant.OutlineDeeporange501:
        return ColorConstant.whiteA700;
      case TextFormFieldVariant.OutlineIndigo50:
        return ColorConstant.whiteA700;
      default:
        return ColorConstant.gray50;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.OutlineDeeporange501:
        return true;
      case TextFormFieldVariant.OutlineIndigo50:
        return true;
      case TextFormFieldVariant.OutlineGray300:
        return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingT30:
        return getPadding(
          left: 29,
          top: 30,
          right: 29,
          bottom: 29,
        );
      default:
        return getPadding(
          left: 19,
          top: 20,
          right: 19,
          bottom: 19,
        );
    }
  }
}

enum TextFormFieldShape {
  RoundedBorder23,
  RoundedBorder7,
}
enum TextFormFieldPadding {
  PaddingT20,
  PaddingT30,
}
enum TextFormFieldVariant {
  FillGray50,
  OutlineDeeporange501,
  OutlineIndigo50,
  OutlineGray300,
}
enum TextFormFieldFontStyle {
  OpenSans1347,
  PoppinsMedium154,
  OpenSans1346,
}
