import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);

  static const Color greyColor = Color(0xFF919191);

  static const Color primaryColor = Color(0xFF4398D3);

  static const Color lightTextColor = Color(0xFF4A6572);
  static const Color darkTextColor = Color(0xFF253840);
  static const Color darkTextColor2 = Color(0xFF17262A);
  static const Color disabledTextColor = Color(0xFF767676);

  static const Color bgColor = Color(0xFFF5F5F5);
  static const Color disabledBgColor = Color(0xFF364A54);
  static const Color spacerColor = Color(0xFFF2F2F2);

  static const String fontFamily = 'Roboto';

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
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkTextColor2,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkTextColor2,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkTextColor2,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkTextColor,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkTextColor,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkTextColor,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightTextColor,
  );
}
