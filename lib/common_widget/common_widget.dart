import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/material.dart';

class CommonView {
  static logoImage(double width, double height) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        Utils.getAssetsImg('logo'),
//        'assets/img/logo.png', 220 ,80
        width: width,
        height: height,
        fit: BoxFit.fill,
      ),
    );
  }

  static backArrow() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Icon(
        Icons.arrow_back,
        color: Colors.black,
        size: 25,
      ),
    );
  }

  static titleText(String title) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 25, bottom: 5),
      child: AllText(
        title,
        color: ColorRes.blackColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static backArrowAndTitle(BuildContext context, String title, Color color) {
    return Stack(
      alignment: Alignment.center,
//      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkResponse(
          onTap: () {
            navigatorPop(context);
          },
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15),
            child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Icon(
                  Icons.arrow_back,
                  color: color,
                  size: 25,
                )),
          ),
        ),
        Center(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 25, bottom: 5),
            child: AllText(
              title,
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
