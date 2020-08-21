import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/filled_button.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/material.dart';

class ManageProfileScreen extends StatefulWidget {
  @override
  _ManageProfileScreenState createState() => _ManageProfileScreenState();
}

class _ManageProfileScreenState extends State<ManageProfileScreen> {

  bool isUserLogin = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.lightWhite,
        body: Column(
          children: <Widget>[
            titleShow(),

            isUserLogin ? userLogo() : logoShow(),

            SizedBox(height: 50),
            AllText(StringRes.youAreNotLogin, fontSize: 28, color: ColorRes.blackColor),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: InkResponse(
                    onTap: () {
                      logInScreenNavigator(context, 2);
                    },
                    child: FilledButton(text: StringRes.logIn, fontSize: 18)))
          ],
        ),
      ),
    );
  }

  titleShow() {
    return  Stack(
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
            child: CommonView.backArrow(),
          ),
        ),
        Center(
          child: CommonView.titleText(StringRes.accountTheYou),
        )
      ],
    );
  }

  logoShow() {
    return Container(
      height: Utils.getDeviceWidth(context) / 2.3,
      width: Utils.getDeviceWidth(context) / 2.3,

      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: ColorRes.profileLogoBg,
        shape: BoxShape.circle,
      ),
      child: Image(image:  AssetImage(Utils.getAssetsImg('logo'))),
    );
  }

  userLogo() {
    return Stack(
//      alignment: Alignment.topCenter
      children: <Widget>[
        Center(
          child: logoShow(),
        ),
        Align(
          alignment: Alignment.topRight,
          child: InkResponse(
            onTap: () {

            },
            child: Container(
              height: 40,
              width: 40,
              margin: EdgeInsets.only(top: 15, right: 20),
              decoration: BoxDecoration(
                color: ColorRes.primaryColor,
                shape: BoxShape.circle
              ),
              child: Icon(Icons.edit, color: Colors.white,),
            ),
          ),
        )
      ],
    );
  }

}
