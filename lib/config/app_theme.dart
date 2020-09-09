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

  static const Icon btnBackIcon = Icon(
    Icons.arrow_back,
    color: Colors.black,
    size: 28.0,
  );

}
