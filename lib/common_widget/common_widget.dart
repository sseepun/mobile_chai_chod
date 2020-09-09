import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/material.dart';

//all screen use  common image logo
class CommonView {
  static logoImage(double width, double height) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        Utils.getAssetsImg('logo-title'),
//        'assets/img/logo.png', 220 ,80
        width: width,
        height: height,
        fit: BoxFit.fill,
      ),
    );
  }


  //all screen common back arrow use
  static backArrow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20,left: 15),
      child: InkResponse(
        onTap: () {
          navigatorPop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 25,
        ),
      ),
    );
  }


  //all screen use common text style
  static titleText(String title) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 20),
      child: AllText(
        title,
        color: ColorRes.blackColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  //all screen common back arrow and title use
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
            padding: EdgeInsets.only(left: 15,top: 20),
            child: Icon(
              Icons.arrow_back,
              color: color,
              size: 25,
            ),
          ),
        ),
        Center(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 25, bottom: 5),
            child: Flexible(
              child: AllText(
                title,
                maxLine: 1,
                overflow: TextOverflow.ellipsis,
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }

  // product details left data design
  static productDetailsLeftRightData(String title, String price, {Color showColor}) {
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: AllText(title,
                  color: ColorRes.blackColor,
                  overflow: TextOverflow.ellipsis,
                  maxLine: 1,
                  align: TextAlign.left)),
          Expanded(
              flex: 1,
              child: AllText(price,
                  color: showColor != null ? showColor :ColorRes.blackColor,
                  overflow: TextOverflow.ellipsis,
                  maxLine: 1,
                  align: TextAlign.right)),
        ],
      ),
    );
  }
  // product details right data design
  static productDetailsLeftRight1Data(String title, String price, {Color showColor}) {
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: AllText(title,
                  color: ColorRes.blackColor,
                  overflow: TextOverflow.ellipsis,
                  maxLine: 1,
                  align: TextAlign.left)),
          Expanded(
              flex: 1,
              child: AllText(price,
                  color: showColor != null ? showColor :ColorRes.blackColor,
                  overflow: TextOverflow.ellipsis,
                  maxLine: 1,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  align: TextAlign.right)),
        ],
      ),
    );
  }


}
