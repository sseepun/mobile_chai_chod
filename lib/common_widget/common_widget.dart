import 'package:ChaiChod/config/util.dart';
import 'package:flutter/material.dart';

class CommonView {

  static logoImage() {
    return Container(
      padding: EdgeInsets.only(top: 60),
      alignment: Alignment.center,
      child: Image.asset(Utils.getAssetsImg('logo'),
//        'assets/img/logo.png',
        width: 220,
        height: 80,
        fit: BoxFit.fill,
      ),
    );
  }

}


