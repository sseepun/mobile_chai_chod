import 'dart:io';

import 'package:ChaiChod/config/color_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Color textColor;
  final Color color;
  final Color disabledColor;
  final Color disabledTextColor;
  final Function onPressed;
  final FocusNode focusNode;
  final Widget child;
  final double fontSize;
  final int isDisabled;

  FilledButton({
    this.text,
    this.child,
    this.height,
    this.width,
    this.textColor,
    this.color,
    this.disabledColor,
    this.disabledTextColor,
    this.onPressed,
    this.focusNode,
    this.fontSize,
    this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    bool disabled = false;
    if(isDisabled != null && isDisabled > 0){
      disabled = true;
    }
    return Container(
      height: height ?? 50,
      width: width ?? double.infinity,
      child: disabled ? _disabledButton() : _button()
    );
  }

  //raise button design
  Widget _button() {
    return RaisedButton(
      focusNode: focusNode,
      disabledColor: disabledColor ?? ColorRes.lightBlur,
      disabledTextColor: disabledTextColor ?? Colors.white,
      highlightElevation: 0,
      onPressed: onPressed,
      textColor: textColor ?? Colors.white,
      child: child ?? Text(text, style: TextStyle(fontSize: fontSize)),
      color: color ?? ColorRes.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      elevation: 0,
    );
  }

  Widget _disabledButton() {
    return RaisedButton(
      focusNode: focusNode,
      disabledColor: disabledColor ?? Colors.black12,
      disabledTextColor: disabledTextColor ?? Colors.white,
      highlightElevation: 0,
      onPressed: () { },
      textColor: textColor ?? Colors.white,
      child: child ?? Text(text, style: TextStyle(fontSize: fontSize)),
      color: color ?? Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      elevation: 0,
    );
  }

}
