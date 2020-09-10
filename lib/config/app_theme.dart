import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:flutter/material.dart';

//app theme display, headline, title, subtitle,body are style design
class AppState {
  static final AppState _singleton = AppState._internal();
  factory AppState() {
    return _singleton;
  }
  AppState._internal();
}

class AppTheme {
  AppTheme._();


  static const TextStyle headerStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 30.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );


  static const TextStyle subHeaderStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 21.0,
    color: Colors.black,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
  );
  static const TextStyle subHeaderBoldStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 21.0,
    color: Colors.black,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
  );
  static const TextStyle subHeaderSmallStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 19.0,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );


  static const TextStyle descStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 18.0,
    color: Colors.black87,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle descSemiboldStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 18.0,
    color: Colors.black87,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle descSmallStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 12.5,
    color: Colors.black87,
    fontWeight: FontWeight.w400,
  );


  static const TextStyle inputLabelStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 16.0,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle inputLabelLargeStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 18.0,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle inputHintStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 16.0,
    color: Colors.grey,
    fontWeight: FontWeight.w400,
  );


  static const TextStyle btnTextStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 20.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle btnTextPrimaryStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 20.0,
    color: ColorRes.primaryColor,
    fontWeight: FontWeight.bold,
  );
  static const Icon btnBackIcon = Icon(
    Icons.arrow_back,
    color: Colors.black,
    size: 25.0,
  );


  static const TextStyle productNameStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 16.0,
    color: Colors.black,
    fontWeight: FontWeight.w600,
    height: 1.2
  );
  static const TextStyle productNameLargeStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 19.0,
    color: Colors.black,
    fontWeight: FontWeight.w500,
    height: 1.2
  );

  static const TextStyle productDescStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 15.0,
    color: Colors.black,
    fontWeight: FontWeight.w300,
    height: 1.2
  );
  static const TextStyle productDescLargeStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 18.0,
    color: Colors.black,
    fontWeight: FontWeight.w300,
    height: 1.2
  );

  static const TextStyle productPriceStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 17.0,
    color: ColorRes.lightBlur,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle productPriceLargeStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 20.0,
    color: ColorRes.lightBlur,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle productUnitStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w300,
  );
  static const TextStyle productUnitLargeStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 16.0,
    color: Colors.black54,
    fontWeight: FontWeight.w500,
    height: 1.25,
  );


  static const TextStyle tabTextStyle = TextStyle(
    fontFamily: StringRes.fontFamilyKanitBlack,
    fontSize: 17.5,
    fontWeight: FontWeight.w500,
  );

}
