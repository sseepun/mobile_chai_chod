import 'package:ChaiChod/config/util.dart';
import 'package:flutter/material.dart';

class CommonView {
  static logoImage(double width, double height ) {
    return Container(
      padding: EdgeInsets.only(top: 70),
      alignment: Alignment.center,
      child: Image.asset(Utils.getAssetsImg('logo'),
//        'assets/img/logo.png', 220 ,80
        width: width,
        height: height,
        fit: BoxFit.fill,
      ),
    );
  }
}

class CommonArrow{
  static backArrow()
  {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Icon(
        Icons.arrow_back,
        color: Colors.black,
        size: 25,
      ),
    );
  }
}

