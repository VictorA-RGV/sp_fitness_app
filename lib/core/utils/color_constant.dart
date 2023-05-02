import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color deepOrange50 = fromHex('#ffe9e9');

  static Color deepOrangeA200 = fromHex('#fe7334');

  static Color red500 = fromHex('#ff3b30');

  static Color gray50 = fromHex('#f8fafc');

  static Color red100 = fromHex('#ffccdd');

  static Color bluegray40075 = fromHex('#758e8e93');

  static Color black900 = fromHex('#0a0615');

  static Color deepOrange501 = fromHex('#f25d29');

  static Color gray9004c = fromHex('#4c121a26');

  static Color black902 = fromHex('#000000');

  static Color black901 = fromHex('#0b0616');

  static Color purple900 = fromHex('#461b93');

  static Color deepOrange500 = fromHex('#f75927');

  static Color deepOrange400 = fromHex('#f5634a');

  static Color bluegray80079 = fromHex('#79454052');

  static Color gray501 = fromHex('#999fa8');

  static Color gray502 = fromHex('#979797');

  static Color black9000a = fromHex('#0a000000');

  static Color gray103 = fromHex('#f5f5f5');

  static Color gray500 = fromHex('#9299a3');

  static Color bluegray5099 = fromHex('#99eaf0f6');

  static Color indigo50 = fromHex('#e5e9ef');

  static Color bluegray100 = fromHex('#d7d7d7');

  static Color gray101 = fromHex('#eff7ff');

  static Color gray300 = fromHex('#d9dfe7');

  static Color gray102 = fromHex('#f2f6f9');

  static Color gray100 = fromHex('#f1f4f8');

  static Color bluegray800 = fromHex('#404b52');

  static Color cyan300 = fromHex('#40dbc1');

  static Color orange50 = fromHex('#ffefdd');

  static Color orange51 = fromHex('#fff7df');

  static Color lime50 = fromHex('#fbf8ee');

  static Color whiteA700 = fromHex('#ffffff');

  static Color deepOrange50033 = fromHex('#33f25d29');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
