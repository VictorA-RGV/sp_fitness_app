import 'package:sp_fitness_app/core/app_export.dart';
import 'package:sp_fitness_app/shared/widgets/spacing.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CustomRadioButton extends StatelessWidget {
  CustomRadioButton(
      {this.padding,
      this.fontStyle,
      this.margin,
      this.onChange,
      this.iconSize,
      this.value,
      this.groupValue,
      this.text});

  RadioPadding? padding;

  RadioFontStyle? fontStyle;

  EdgeInsetsGeometry? margin;

  Function(String)? onChange;

  double? iconSize;

  String? value;

  String? groupValue;

  String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          onChange!(value!);
        },
        child: Row(
          children: [
            SizedBox(
              height: getHorizontalSize(iconSize ?? 0),
              width: getHorizontalSize(iconSize ?? 0),
              child: Theme(
                 data: Theme.of(context).copyWith(
    unselectedWidgetColor: ColorConstant.indigo50,
  
  ),
                child: Radio<String>(
                  value: value ?? "",
                  groupValue: groupValue,
                  activeColor: ColorConstant.deepOrange501,
                  onChanged: (value) {
                    onChange!(value!);
                  },
                ),
              ),
            ),
            HorizontalSpace(width: 10),
            Padding(
              padding: getPadding(
                left: 0,
              ),
              child: Text(
                text ?? "",
                textAlign: TextAlign.center,
                style: _setFontStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return TextStyle(
          color: ColorConstant.gray500,
          fontSize: getFontSize(
            11.55,
          ),
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w400,
        );

    }
  }
}

enum RadioPadding {
  PaddingT5,
}
enum RadioFontStyle {
  OpenSans1155,
}
