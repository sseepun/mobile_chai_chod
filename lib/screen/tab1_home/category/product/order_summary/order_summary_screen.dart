import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/filled_button.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/config/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ChaiChod/screen/tab1_home/category/product/order_summary/service/service_screen.dart';

class OrderSummaryScreen extends StatefulWidget {
  @override
  _OrderSummaryScreenState createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> with SingleTickerProviderStateMixin {
  final controller = PageController();
  bool monVal = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: CommonView.appBarTitleWithDesc(
            context, StringRes.OrderSummaryTitle,
            StringRes.OrderSummaryDescription
          ),
          bottomNavigationBar: bottomBar(),
          backgroundColor: ColorRes.bgColor,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    productDetailsView(),
                    Divider(height: 1, color: Colors.black26),
                    addressSelection(),
                    Divider(height: 1, color: Colors.black26),
                    discountDetails(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Cart screen in Bottom bar Continue button
  bottomBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      decoration: BoxDecoration(
        color: ColorRes.whiteColor,
        border: Border(top: BorderSide(color: Colors.black12, width: 1.0))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CommonView.productDetailRow(StringRes.payment, 'World Bank of Thailand', false),
          CommonView.productDetailRow(StringRes.price, 'B2,000', false),
          CommonView.productDetailRow(StringRes.sectionAA, 'B0', false),
          CommonView.productDetailRow(StringRes.shipping, 'B50', false),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: FilledButton(
              text: 'เลือกช่องทางการชำระเงิน',
              fontSize: 20,
              height: 58,
              onPressed: (){
                // orderSummaryScreenNavigator(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  productDetailsView() {
    return Container(
      height: 260,
      color: Colors.white,
      width: Utils.getDeviceWidth(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Text(
              "E NANKANG AS 2+ _205/55R16",
              style: AppTheme.descStyle,
            )
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 150,
                    child: Image(
                      image: AssetImage(Utils.getAssetsImg('tiers'))
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        CommonView.productDetailRowSmall(StringRes.brand, StringRes.miCheIn),
                        CommonView.productDetailRowSmall(StringRes.pageWidth, "195 mm."),
                        CommonView.productDetailRowSmall(StringRes.serialNumber, "Fifty five"),
                        CommonView.productDetailRowSmall(StringRes.edgeNumber, "Fifteen"),
                        CommonView.productDetailRowSmall(StringRes.sideWall, "10.72 cm."),
                        SizedBox(height: 10),
                        Divider(height: 1, color: Colors.black26),
                        SizedBox(height: 10),
                        CommonView.productDetailRowSmall(StringRes.numberItem, "x1"),
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  addressSelection(){
    return InkResponse(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => ServiceScreen())
        );
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 12, 15, 20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              StringRes.serviceDetails,
              style: AppTheme.subHeaderSmallStyle,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    StringRes.serviceDetails1,
                    style: AppTheme.descGreyStyle,
                  ),
                  AppTheme.chevRightIcon
                ],
              ),
            ),
          ],
        )
      ),
    );
  }

  discountDetails(){
    return Container(
      padding: EdgeInsets.fromLTRB(5, 12, 15, 10),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 10),
            child: Text(
              StringRes.discountDetails,
              style: AppTheme.subHeaderSmallStyle,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            margin: EdgeInsets.only(left: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: discountTextField(),
                ),
                Container(
                  height: 50,
                  width: 68,
                  padding: EdgeInsets.only(left: 8),
                  child: FlatButton(
                    color: ColorRes.primaryColor,
                    child: Text(
                      StringRes.discountDetailsBtn2,
                      style: AppTheme.btnSmallTextStyle,
                    ),
                    onPressed: () { },
                  )
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5, left: 0),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: monVal,
                  onChanged: (bool value) {
                    setState(() {
                      monVal = value;
                    });
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Container(
                  padding: EdgeInsets.only(left: 5),
                  child: AllText(
                    "ขอใบกำกับภาษี",
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
      /*    Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.check_box,
                  size: 25,
                  color: ColorRes.primaryColor,
                ),
                Container(
                  padding: EdgeInsets.only(left: 7),
                  child:AllText(
                    "ขอใบกำกับภาษี",
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),*/
        ],
      )
    );
  }

  discountTextField(){
    return TextField(
      style: TextStyle(
        fontSize: 15, 
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontFamily: StringRes.fontFamilyKanitBlack,
      ),
      decoration: InputDecoration(
        hintText: StringRes.discountDetailsBtn1,
        filled: true,
        fillColor: ColorRes.whiteColor,
        contentPadding: EdgeInsets.only(left: 10, right: 10),
        hintStyle: TextStyle(
          fontSize: 15,
          color: Colors.black38,
          fontWeight: FontWeight.w400,
          fontFamily: StringRes.fontFamilyKanitBlack,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black26),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorRes.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black26),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
      ),
    );
  }

}
