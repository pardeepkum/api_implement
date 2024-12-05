import 'package:flutter/material.dart';

class MyColors {
  static Color custom(String c) {
    final int color = int.parse('0xFF$c');
    return Color(color);
  }

  static Color trans = Colors.transparent;
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color greenPrimary = const Color(0xff19C179);
  static Color greenLightPrimary = const Color(0xff81DEB6);
  static Color grassGreen = const Color(0xffEAFAE0);
  static Color grey = const Color(0xffA5ABB3);
  static Color greyLight = const Color(0xffE4E4E5);
  static Color registerList = const Color(0xff2C3A4B);
  static Color fontBlack = const Color(0xff2B3A4B);
  static Color createProfile = const Color(0xff09101D);
  static Color registerImage = const Color(0xffFDFFD6);
  static Color registerImage2 = const Color(0xffE6EEFF);
  static Color registerImage1 = const Color(0xffedb8fc);
  static Color shadowColor = const Color(0xffC4C4C4);
  static Color disableBtnColor = const Color(0x6619c179);
  static Color regColor = const Color(0xFFEBEEF2);
  static Color errorBg = const Color(0xFFFEEFEF);
  static Color error = const Color(0xFFDA1414);
  static Color success = const Color(0xFF23A757);
  static Color successBg = const Color(0xFFEDF9F0);
  static Color cardColor = const Color(0xFFEAFAE0);
  static Color bonusBtnColor = const Color(0xFFFCFDC4);
  static Color greyDeep = const Color(0xFFA5ABB3);
  static Color pastelRed = const Color(0xFFFFDEDE);
  static Color redColor = const Color(0xFFFF5959);
  static Color pastelPurple = const Color(0xFFE2DFFE);
  static Color pastelGreen = const Color(0xFFEAFAE0);
  static Color skyColor = const Color(0xFFC9F6ED);
}
