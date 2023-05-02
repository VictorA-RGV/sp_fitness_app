import 'package:sp_fitness_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.height,
      this.width,
      this.child,
      this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? height;

  double? width;

  Widget? child;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        constraints: BoxConstraints(
          minHeight: getSize(height ?? 0),
          minWidth: getSize(width ?? 0),
        ),
        padding: EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: getSize(width ?? 0),
          height: getSize(height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
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
      case IconButtonPadding.PaddingAll6:
        return getPadding(
          all: 6,
        );
      case IconButtonPadding.PaddingAll10:
        return getPadding(
          all: 10,
        );
      default:
        return getPadding(
          all: 13,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.FillWhiteA700:
        return ColorConstant.whiteA700;
      case IconButtonVariant.FillDeeporange50:
        return ColorConstant.deepOrange50;
      case IconButtonVariant.FillGray101:
        return ColorConstant.gray101;
      case IconButtonVariant.OutlineIndigo50:
        return ColorConstant.whiteA700;
      case IconButtonVariant.OutlineBluegray5099:
        return ColorConstant.whiteA700;
      case IconButtonVariant.FillOrange51:
        return ColorConstant.orange51;
      case IconButtonVariant.OutlineIndigo501_2:
        return null;
      default:
        return ColorConstant.deepOrange501;
    }
  }

  _setBorder() {
    switch (variant) {
      case IconButtonVariant.OutlineIndigo50:
        return Border.all(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            0.96,
          ),
        );
      case IconButtonVariant.OutlineIndigo501_2:
        return Border.all(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            0.96,
          ),
        );
      case IconButtonVariant.FillDeeporange501:
      case IconButtonVariant.FillWhiteA700:
      case IconButtonVariant.FillDeeporange50:
      case IconButtonVariant.FillGray101:
      case IconButtonVariant.OutlineBluegray5099:
      case IconButtonVariant.FillOrange51:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.RoundedBorder11:
        return BorderRadius.circular(
          getHorizontalSize(
            11.54,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            7.70,
          ),
        );
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case IconButtonVariant.OutlineBluegray5099:
        return [
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
              4.81635046005249,
            ),
          )
        ];
      case IconButtonVariant.FillDeeporange501:
      case IconButtonVariant.FillWhiteA700:
      case IconButtonVariant.FillDeeporange50:
      case IconButtonVariant.FillGray101:
      case IconButtonVariant.OutlineIndigo50:
      case IconButtonVariant.OutlineIndigo501_2:
      case IconButtonVariant.FillOrange51:
        return null;
      default:
        return null;
    }
  }
}

enum IconButtonShape {
  RoundedBorder11,
  RoundedBorder7,
}

enum IconButtonPadding {
  PaddingAll6,
  PaddingAll13,
  PaddingAll10,
}

enum IconButtonVariant {
  FillDeeporange501,
  FillWhiteA700,
  FillDeeporange50,
  FillGray101,
  OutlineIndigo50,
  OutlineIndigo501_2,
  OutlineBluegray5099,
  FillOrange51,
}
