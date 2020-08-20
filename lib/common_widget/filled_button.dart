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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 50,
        width: width ?? double.infinity,
        child: _button());
  }

  Widget _button() {
    return RaisedButton(
      focusNode: focusNode,

      disabledColor: disabledColor ?? ColorRes.lightBlur,
      disabledTextColor: disabledTextColor ??Colors.white ,
      highlightElevation: 0,
      onPressed: onPressed,
      textColor: textColor ?? Colors.white,
      child: child ?? Text(text, style: TextStyle(fontSize: fontSize)),
      color: color ?? Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      elevation: 0,
    );
  }

/*  Widget _iOSButton() {
    var dTextColor = disabledTextColor ?? primaryDark;
    var txtColor = textColor ?? Colors.white;
    return CupertinoButton(padding: child==null? EdgeInsets.all(0):EdgeInsets.symmetric(horizontal: 10),
      disabledColor: disabledColor ?? primaryLight,
      onPressed: onPressed,
      child: child ??
          Text(
            text,
            style: TextStyle(
              color: onPressed == null ? dTextColor : txtColor,
            ),
          ),
      color: color ?? primaryDark,
      borderRadius: BorderRadius.circular(7.0),
    );
  }*/
}
