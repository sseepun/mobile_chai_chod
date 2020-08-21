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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.lightWhite,
        body: Column(
          children: <Widget>[
            titleShow(),
            logoShow(),
            SizedBox(height: 50),
            AllText(StringRes.youAreNotLogin, fontSize: 28, color: ColorRes.blackColor),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: InkResponse(
                    onTap: () {
                      logInScreenNavigator(context);
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
      height: 150,
      width: 150,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: ColorRes.profileLogoBg,
        shape: BoxShape.circle,
      ),
      child: Image(image:  AssetImage(Utils.getAssetsImg('logo'))),
    );
  }

}
