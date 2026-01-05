import 'package:bmi_calculator/constant/app_color.dart';
import 'package:flutter/material.dart';


class AppTextstyle {
  /// Regular -> 400
  /// Medium -> 500
  /// Bold -> 600
  /// Semi-Bold -> 700
  /// Extra Bold -> 800

  static String fontFamily = 'Inter';

 static TextStyle tsItalicSize31White = TextStyle(
    fontFamily: fontFamily,
    fontSize: 31,
    fontWeight: FontWeight.w800,
    color: AppColor.whiteColor,
  );
 static TextStyle tsBoldSize25White = TextStyle(
    fontFamily: fontFamily,
    fontSize: 25,
    fontWeight: FontWeight.w700,
    color: AppColor.whiteColor,
  );
  static TextStyle tsRegularSize16White = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColor.whiteColor,
  );
   static TextStyle tsMediumSize18White = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColor.whiteColor,
  );
  static TextStyle tsRegularSize18Navi = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColor.naviColor,
  );
}
