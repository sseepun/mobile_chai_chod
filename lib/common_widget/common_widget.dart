import 'package:ChaiChod/config/util.dart';
import 'package:flutter/material.dart';

class CommonView {
  static logoImage() {
    return Container(
      padding: EdgeInsets.only(top: 70),
      alignment: Alignment.center,
      child: Image.asset(Utils.getAssetsImg('logo'),
//        'assets/img/logo.png',
        width: width,
        height: 80,
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

