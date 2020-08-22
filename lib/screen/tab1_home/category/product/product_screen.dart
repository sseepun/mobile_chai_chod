import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/export.dart';
import 'package:ChaiChod/screen/tab1_home/category/category_screen.dart';
import 'package:ChaiChod/screen/tab4_user/manage_profile/edit_profile/edit_profile_screen.dart';
import 'package:ChaiChod/screen/tab4_user/manage_profile/manage_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorRes.lightWhite,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                child:_appBar(),
              ),
              Container(
              margin: EdgeInsets.only(top: 70),
                child: userLogo(),
              ),
            ],
          ),
        ));
  }

  Widget _appBar() {
    return Container(
        height: 450,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 50,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(top: 17),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryScreen()),
                        );
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.black,
                      )),
//        child: Image.asset(Utils.getAssetsImg('logo')),
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(left: 80, top: 10),
                  child: Row(
                    children: <Widget>[
                      AllText(
                        StringRes.ProductTitle,
                        color: ColorRes.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      IconButton(
                        onPressed: () {
                          print('Shopping Cart');
                          cartScreenNavigator(context);
                        },
                        padding: EdgeInsets.only(
                          bottom: 5,
                          left: 80,
                        ),
                        icon: Icon(Icons.shopping_basket),
                        iconSize: 28,
                        color: ColorRes.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  userLogo() {
    return Stack(
//      alignment: Alignment.topCenter
      children: <Widget>[
        Center(
          child: Image.asset(
            Utils.getAssetsImg('productimg'),
            height: 250,
            width: 250,
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: InkResponse(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()),
              );
            },
            child: Container(
              height: 35,
              width: 35,
              margin: EdgeInsets.only(top: 10, right: 7),
              decoration: BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                      offset: Offset(0.5, 0.5),
                      color: ColorRes.greyColor,
                      blurRadius: 0.5,
                    ),
                  ],
                  color: ColorRes.whiteColor, shape: BoxShape.circle),
              child: Icon(
                Icons.favorite,
                color: ColorRes.primaryColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
