import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/filled_button.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/material.dart';
import 'edit_profile/edit_profile_screen.dart';

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
            CommonView.backArrowAndTitle(context, StringRes.accountTheYou, ColorRes.blackColor),

            isUserLogin ? userLogo() : logoShow(),

            SizedBox(height: isUserLogin ? 25 : 50),

            isUserLogin ? AllText("Your Name", fontSize: 20, color: ColorRes.blackColor): Container(),

            isUserLogin ? Container() : AllText(StringRes.youAreNotLogin, fontSize: 28, color: ColorRes.blackColor),
            SizedBox(height: 20),

            isUserLogin ? userDetails() : loginButton()
          ],
        ),
      ),
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

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()),
              );
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

  userDetails() {
    return Container(
      width: Utils.getDeviceWidth(context),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: ColorRes.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          titleText(StringRes.storeName, "nutchatya.cha"),
          Divider(height: 1, color: ColorRes.greyColor),

          titleText(StringRes.hTax, "98765431215988"),
          Divider(height: 1, color: ColorRes.greyColor),

          titleText(StringRes.currentAddress, "999/9 nawamin, bueng kum, post 10330"),
        ],
      ),
    );
  }

  titleText(String title, String subTitle) {
    return Container(
      color: ColorRes.whiteColor,
      margin: EdgeInsets.only(bottom: 10, top: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title),
          SizedBox(height: 2),
          Text(subTitle)
        ],
      ),
    );
  }

  loginButton() {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: InkResponse(
            onTap: () {
              logInScreenNavigator(context, 2);
            },
            child: FilledButton(text: StringRes.logIn, fontSize: 18)));
  }


}
