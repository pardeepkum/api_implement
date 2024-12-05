
import 'package:api_testing/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyTexts extends TextTheme {
  static const String Montserrat = 'Montserrat';

  //bool Ukr = 'Ukr';

  /// Medium = 500 , light = 400 , bold = 600
  /// Format {fontWeight}size

  static TextStyle get medium14 => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: MyColors.fontBlack,
    fontFamily: Montserrat,
  );

  static TextStyle get medium12 => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: MyColors.fontBlack,
    fontFamily: Montserrat,
  );
  static TextStyle get medium10 => TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: MyColors.fontBlack,
    fontFamily: Montserrat,
  );

  static TextStyle get light14 => TextStyle(
    fontFamily: Montserrat,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: MyColors.fontBlack,
  );
  static TextStyle get light12 => TextStyle(
    fontFamily: Montserrat,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: MyColors.fontBlack,
  );
  static TextStyle get light16 => TextStyle(
    fontFamily: Montserrat,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: MyColors.fontBlack,
  );

  static TextStyle get medium16 => TextStyle(
    fontFamily: Montserrat,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: MyColors.fontBlack,
  );

  static TextStyle get light24 => TextStyle(
    fontFamily: Montserrat,
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    color: MyColors.fontBlack,
  );

  static TextStyle get light22 => TextStyle(
    fontFamily: Montserrat,
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: MyColors.fontBlack,
  );

  static TextStyle get bold14 => TextStyle(
    fontFamily: Montserrat,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: MyColors.fontBlack,
  );

  static TextStyle get bold16 => TextStyle(
    fontFamily: Montserrat,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: MyColors.fontBlack,
  );
  static TextStyle get bold12 => TextStyle(
    fontFamily: Montserrat,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: MyColors.fontBlack,
  );

  static TextStyle get bold18 => TextStyle(
    fontFamily: Montserrat,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: MyColors.fontBlack,
  );

  static TextStyle get extraBold20 => TextStyle(
    fontFamily: Montserrat,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: MyColors.fontBlack,
  );

  static TextStyle get extraBold12 => TextStyle(
    fontFamily: Montserrat,
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: MyColors.fontBlack,
  );

  static TextStyle get extraBold14 => TextStyle(
    fontFamily: Montserrat,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: MyColors.fontBlack,
  );

  static TextStyle get extraBold16 => TextStyle(
    fontFamily: Montserrat,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: MyColors.fontBlack,
  );

  static TextStyle get extraBold22 => TextStyle(
    fontFamily: Montserrat,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: MyColors.fontBlack,
  );

  static TextStyle get extraBold18 => TextStyle(
    fontFamily: Montserrat,
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: MyColors.fontBlack,
  );
}
