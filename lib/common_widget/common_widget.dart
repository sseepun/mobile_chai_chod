import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/app_theme.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/material.dart';

//all screen use  common image logo
class CommonView {
  static logoImage(double width, double height) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        Utils.getAssetsImg('logo-title'),
        width: width,
        fit: BoxFit.fill,
      ),
    );
  }
  static icon(String file, double width, double height) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        Utils.getIcon(file),
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
  
  static backIconButton(context){
    return IconButton(
      icon: AppTheme.btnBackIcon,
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
  static cartIconButton(context, int unit, double topPosition){
    return IconButton(
      onPressed: () {
        print('Shopping Cart');
        cartScreenNavigator(context);
      },
      padding: EdgeInsets.only(right: 10),
      icon: Stack(
        children: <Widget>[
          CommonView.icon('cart.png', 25, 25),
          Positioned(
            top: topPosition,
            right: 3.0,
            child: Container(
              width: unit > 0 ? 14 : 0,
              height: unit > 0 ? 14 : 0,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: unit > 0
                ? Text(
                  '$unit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    height: 1.4
                  ),
                )
                : Container(),
            )
          )
        ]
      ),
    );
  }
  static searchIconButton(context){
    return IconButton(
      onPressed: () {
        print('Search');
      },
      icon: Icon(Icons.search),
      color: ColorRes.primaryColor,
      iconSize: 28,
    );
  }


  //all screen use common text style
  static titleText(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Text(
        title,
        style: AppTheme.subHeaderBoldStyle,
      ),
    );
  }

  //rowCard
  static rowCard(String leftText, String rightText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          leftText,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: StringRes.fontFamilyKanitBlack,
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          )
        ),
        Text(
          rightText,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: StringRes.fontFamilyKanitBlack,
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          )
        ),
      ],
    );
  }
  static rowCardGrey(String leftText, String rightText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          leftText,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: StringRes.fontFamilyKanitBlack,
            fontSize: 16.0,
            color: Colors.black45,
            fontWeight: FontWeight.w400,
          )
        ),
        Text(
          rightText,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: StringRes.fontFamilyKanitBlack,
            fontSize: 16.0,
            color: Colors.black45,
            fontWeight: FontWeight.w400,
          )
        ),
      ],
    );
  }
  static rowCardWithColor(String leftText, String rightText, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          leftText,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: StringRes.fontFamilyKanitBlack,
            fontSize: 16.0,
            color: color,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          rightText,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: StringRes.fontFamilyKanitBlack,
            fontSize: 16.0,
            color: Colors.black45,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  // all screen common back arrow and title use
  static backArrowAndTitle(BuildContext context, String title, Color color) {
    return Stack(
      alignment: Alignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkResponse(
          onTap: () {
            navigatorPop(context);
          },
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15, right: 20),
            child: AppTheme.btnBackIcon,
          ),
        ),
        Center(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.subHeaderBoldStyle,
            ),
          ),
        )
      ],
    );
  }

  static appBarTitle(BuildContext context, String title) {
    return AppBar(
      elevation: 0,
      leading: backIconButton(context),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTheme.subHeaderBoldStyle,
      ),
      backgroundColor: Colors.white,
    );
  }
  static appBarTitleBg(BuildContext context, String title) {
    return AppBar(
      elevation: 0,
      leading: backIconButton(context),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTheme.subHeaderBoldStyle,
      ),
      backgroundColor: ColorRes.bgColor,
    );
  }
  static appBarTitleWithDesc(BuildContext context, String title, String desc) {
    return AppBar(
      elevation: 0,
      leading: backIconButton(context),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTheme.subHeaderBoldStyle,
      ),
      backgroundColor: Colors.white,
      bottom: PreferredSize(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black12,
                width: 1.0,
              )
            )
          ),
          child: Text(
            desc,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTheme.descGreySmallStyle,
          ),
        ),
        preferredSize: Size(0.0, 22.0),
      ),
    );
  }

  // product details left data design
  static productDetailRow(String title, String detail, bool greyRow) {
    return Container(
      color: greyRow ? Color(0xFFEFEFEF): Colors.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: AppTheme.productDescStyle,
            ),
            Text(
              detail,
              style: AppTheme.productDescStyle,
            )
          ],
        ),
      ),
    );
  }
  static productDetailRowSmall(String title, String detail) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: AppTheme.productDescStyle,
            ),
            Text(
              detail,
              style: AppTheme.productDescStyle,
            )
          ],
        ),
      ),
    );
  }
  static productDetailRowLarge(String title, String detail) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: AppTheme.descSemiboldStyle,
            ),
            Text(
              detail,
              style: AppTheme.descSemiboldStyle,
            )
          ],
        ),
      ),
    );
  }

  // product details left data design
  static productDetailsLeftRightData(String title, String price, {Color showColor}) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
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
