import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../user_screen.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> listTitle = ['goodyear1', 'goodyear2', 'goodyear3', 'goodyear4'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorRes.lightWhite,
          body: SingleChildScrollView(
            child: Column(
//              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                CommonView.backArrowAndTitle(context, StringRes.favorites, ColorRes.blackColor),
                SizedBox(height: 20),

                gridImage(),
                SizedBox(height: 20),
              ],
            ),
          )),
    );
  }

  gridImage() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listTitle.length,
      padding: EdgeInsets.only(left: 10, right: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: Utils.getDeviceWidth(context) /
              (Utils.getDeviceHeight(context) / 1.27)),
      itemBuilder: (context, index) {
        return Container(
          height: 150,
          padding: EdgeInsets.only(left: 8, right: 8),
          color: ColorRes.whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image(image: AssetImage(Utils.getAssetsImg('tiers'))),
              Column(
//                  mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AllText(
                    "GOODYEAR",
                    color: ColorRes.blackColor,
                  ),
                  AllText(
                    "Tires 225/45/R17",
                    color: ColorRes.blackColor,
                  ),
                  AllText(
                    "\$2,000 /len.",
                    color: ColorRes.blackColor,
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
