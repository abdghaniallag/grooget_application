import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex('#D90429');
  static Color darkGray = HexColor.fromHex('#2b2d42');
  static Color gray = HexColor.fromHex('#737477');
  static Color lightGray = HexColor.fromHex('#8d99ae');
  static Color primaryOpacity70 = HexColor.fromHex('#FB5607');

  static Color darkPrimary = HexColor.fromHex('#d17d11');
  static Color green = Colors.green;
  static Color gray1 = HexColor.fromHex('#707070');
  static Color gray2 = HexColor.fromHex('#797979');
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color error = HexColor.fromHex('#e61f34');
  static Color black = HexColor.fromHex('#000000');
}

extension HexColor on Color {
  static Color fromHex(String hexCoolorString) {
    hexCoolorString = hexCoolorString.replaceAll('#', '');
    if (hexCoolorString.length == 6) {
      hexCoolorString = 'FF' + hexCoolorString; // Color with 100 opacity
    }
    return Color(int.parse(hexCoolorString, radix: 16));
  }
}
