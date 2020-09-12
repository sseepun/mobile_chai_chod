import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/filled_button.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/app_theme.dart';
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
                cardListViewData(),
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
          CommonView.productDetailRow(StringRes.prices, "\$2,000", false),
          CommonView.productDetailRow(StringRes.discount, "\$0", false),
          CommonView.productDetailRow(StringRes.total, "\$2,000", false),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: FilledButton(
              text: StringRes.continueText, 
              fontSize: 20,
              height: 58,
              onPressed: (){
                orderSummaryScreenNavigator(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  // List of Cart Design
  cardListViewData() {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          height: 310,
          width: Utils.getDeviceWidth(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Row(
                  children: <Widget>[
                    InkResponse(
                      onTap: () {
                        setState(() {
                          isCheckValue = !isCheckValue;
                        });
                      },
                      child: Container(
                        height: 18,
                        width: 18,
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          color: ColorRes.primaryColor,
                          border: Border.all(width: 2, color: ColorRes.primaryColor)
                        ),
                        child: SizedBox(
                          height: 18.0,
                          width: 18.0,
                          child: Icon(
                            Icons.check, 
                            color: Colors.white, 
                            size: 15,
                          ),
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "E NANKANG AS 2+ _205/55R16",
                        style: AppTheme.descStyle,
                      ),
                    ),
                  ],
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
                            incrementRow(),
                          ],
                        )
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: ColorRes.bgColor,
                padding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      StringRes.prices,
                      style: AppTheme.descStyle,
                    ),
                    Text(
                      "\$2,000", 
                      style: AppTheme.productPriceStyle,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }

  // Number are increment and decrement
  incrementRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            StringRes.numberItem,
            style: AppTheme.productDescLargeStyle,
          ),
        ),
        Row(
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
                fontSize: 22,
                color: productCountShow > 1 
                  ? ColorRes.primaryColor 
                  : Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4, left: 15, right: 15),
              child: Text(
                "$productCountShow",
                style: AppTheme.productDescLargeStyle,
              ),
            ),
            InkResponse(
              onTap: () {
                productCountShow += 1;
                setState(() {});
              },
              child: AllText(
                "+", 
                fontSize: 22
              ),
            ),
          ],
        )
      ],
    );
  }

}
