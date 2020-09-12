import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/filled_button.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/material.dart';

import '../../common_widget/common_route.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int productCountShow = 1;
  bool isCheckValue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: ColorRes.blackColor, //change your color here
            ),
            title: Text(StringRes.shoppingCart, style: TextStyle(color: ColorRes.blackColor)),
            backgroundColor: Colors.white,
//            title: CommonView.appBarTitle(context, StringRes.shoppingCart),
            centerTitle: true,
          ),
          bottomNavigationBar: bottomBar(),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                listViewData(),
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
      // height: 150,
      padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
      decoration: BoxDecoration(
          color: ColorRes.whiteColor,
          border:
              Border(top: BorderSide(color: ColorRes.greyColor, width: 1.0))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CommonView.productDetailsLeftRightData(StringRes.prices, "\$2,000"),
          CommonView.productDetailsLeftRightData(StringRes.discount, "\$0"),
          CommonView.productDetailsLeftRightData(StringRes.total, "\$2,000"),
          // Padding(
              // padding: EdgeInsets.only(left: 10, right: 10),
              // child:
              FilledButton(text: StringRes.continueText, fontSize: 18,onPressed: (){
                orderSummaryScreenNavigator(context);

              },),
    // )
        ],
      ),
    );
  }

// List of Cart Design
  listViewData() {
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: Utils.getDeviceWidth(context),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                    child: Row(
                      children: <Widget>[
                        InkResponse(
                          onTap: () {
                            setState(() {
                              isCheckValue = !isCheckValue;
                            });
                          },
                          child: Container(
                            height: 15,
                            width: 15,
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: ColorRes.primaryColor)
                            ),
                            child: Icon(Icons.check, color: ColorRes.primaryColor, size: 15),
                          ),
                        ),
                        AllText(" E NANKANG AS 2+ _205/55R16",
                            color: ColorRes.blackColor, fontSize: 17),
                      ],
                    )),
                Expanded(
                  child: Container(
                    color: ColorRes.whiteColor,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 150,
                          width: 150,
                          child: Image(
                              image: AssetImage(Utils.getAssetsImg('tiers'))),
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CommonView.productDetailsLeftRightData(
                                StringRes.brand, StringRes.miCheIn),
                            CommonView.productDetailsLeftRightData(StringRes.pageWidth, "195 mm."),
                            CommonView.productDetailsLeftRightData(
                                StringRes.serialNumber, "Fifty five"),
                            CommonView.productDetailsLeftRightData(StringRes.edgeNumber, "Fifteen"),
                            CommonView.productDetailsLeftRightData(StringRes.sideWall, "10.72 cm."),
                            Divider(
                              height: 1,
                              color: ColorRes.greyColor,
                            ),
                            incrementRow(),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  color: ColorRes.lightWhite,

                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AllText(StringRes.prices, color: ColorRes.blackColor),
                      AllText("\$2,000", color: ColorRes.blackColor)
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

// Number are increment and decrement
  incrementRow() {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              child: AllText(StringRes.numberItem,
                  maxLine: 1,
                  align: TextAlign.left,
                  color: ColorRes.blackColor),
            )),
        Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkResponse(
                  onTap: () {
                    if (productCountShow > 1) {
                      productCountShow -= 1;
                      setState(() {});
                    }
                  },
                  child: AllText(
                    "-",
                    fontSize: 25,
                    color: productCountShow > 1 ? ColorRes.primaryColor : ColorRes.greyColor,
                  ),
                ),
                AllText(
                  "$productCountShow",
                  fontSize: 18,
                  color: ColorRes.blackColor,
                ),
                InkResponse(
                  onTap: () {
                    productCountShow += 1;
                    setState(() {});
                  },
                  child: AllText("+", fontSize: 20),
                ),
              ],
            )),
      ],
    );
  }
}
