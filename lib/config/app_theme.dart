import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:flutter/material.dart';


class AppState {
  static final AppState _singleton = AppState._internal();
  factory AppState() {
    return _singleton;
  }
  AppState._internal();


}

class AppTheme {
  AppTheme._();


  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle(
    fontFamily: StringRes.fontFamilyRoboto,
    fontWeight: FontWeight.w600,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: ColorRes.darkTextColor2,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: StringRes.fontFamilyRoboto,
    fontWeight: FontWeight.w600,
    fontSize: 24,
    letterSpacing: 0.27,
    color: ColorRes.darkTextColor2,
  );

  static const TextStyle title = TextStyle(
    fontFamily: StringRes.fontFamilyRoboto,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    letterSpacing: 0.18,
    color: ColorRes.darkTextColor2,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: StringRes.fontFamilyRoboto,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: ColorRes.darkTextColor,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: StringRes.fontFamilyRoboto,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: ColorRes.darkTextColor,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: StringRes.fontFamilyRoboto,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: ColorRes.darkTextColor,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: StringRes.fontFamilyRoboto,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: ColorRes.lightTextColor,
  );
}
