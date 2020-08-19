import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:flutter/material.dart';

class AllText extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign align;
  final Color color;
  final double height;
  final int maxLine;
  final double opacity;
  final TextOverflow overflow;
  final double letterSpace;


  AllText(this.title,
      {this.fontWeight,
        this.fontSize,
        this.maxLine,
        this.opacity = 1,
        this.align = TextAlign.start,
        this.height,
        this.overflow,
        this.letterSpace = 0,
        this.color = ColorRes.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLine,
      textAlign: align,
      overflow: overflow,
      style: TextStyle(
        color: color.withOpacity(opacity),
        letterSpacing: letterSpace,
        fontFamily: StringRes.fontFamilyRoboto,
//        fontFamily: 'Helvetica',
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize,
        height: height,
      ),
    );
  }
}
