import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/order_details/order_history/payment_transfer/payment_success/payment_sccess_screen.dart';
import 'package:flutter/material.dart';

class PaymentBillingScreen extends StatefulWidget {
  final int i;

  const PaymentBillingScreen({Key key, this.i}) : super(key: key);

  _PaymentBillingScreenState createState() => _PaymentBillingScreenState();
}

class _PaymentBillingScreenState extends State<PaymentBillingScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorRes.lightWhite,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      // Heading back arrow and title
                      CommonView.backArrowAndTitle(context, StringRes.paymentBillingTitle1, ColorRes.blackColor),
                      appBarDesign(),
                    ],
                  ),
                ),
                //all method are call
                Divider(height: 1, color: ColorRes.greyColor),
                productDetailsView(),
                statusShow(),
                productDetailsView1(),
                statusShow1(),
                productPriceView(),
                Divider(height: 1, color: ColorRes.greyColor),
                bottomButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // app bar design are use in payment Billing Title
  appBarDesign() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: AllText(
              StringRes.paymentBillingTitle2,
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            alignment: Alignment.center,
            child: AllText(
              StringRes.paymentBillingTitle3,
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }


  //productDetails in left and right side text
  productDetails(String leftTile, String rightSide) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 7, right: 7),
      child: Row(
        children: <Widget>[
          Expanded(
            child: AllText(
              leftTile,
              color: ColorRes.blackColor,
            ),
          ),
          Expanded(
            child: AllText(rightSide,
                align: TextAlign.end, color: ColorRes.blackColor),
          ),
        ],
      ),
    );
  }

  //product Details View are use this screen in text ,image, brand, pageWidth, seriesNumber, edgeRubber, sidewall
  productDetailsView() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Text('NANKA AS 2+ - 205/5RR/A'),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                width: Utils.getDeviceWidth(context) / 3.3,
                child:
                Image.asset(Utils.getAssetsImg('tiers'), fit: BoxFit.fill),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    CommonView.productDetailsLeftRightData(
                        StringRes.brand, "Micheline"),
                    SizedBox(height: 2),
                    CommonView.productDetailsLeftRightData(
                        StringRes.pageWidth, "199mm"),
                    SizedBox(height: 2),
                    CommonView.productDetailsLeftRightData(
                        StringRes.seriesNumber, "55"),
                    SizedBox(height: 2),
                    CommonView.productDetailsLeftRightData(
                        StringRes.edgeRubber, "51'"),
                    SizedBox(height: 2),
                    CommonView.productDetailsLeftRightData(
                        StringRes.sidewall, "10.72 cm"),
                    SizedBox(height: 10),
                    Divider(
                      height: 5,
                      color: ColorRes.greyColor,
                    ),
                    productDetails(StringRes.count, "x1"),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  statusShow() {
    return Container(
//      height: 50,
      color: ColorRes.lightWhite,
      padding: EdgeInsets.only(left: 15, right: 10, bottom: 10, top: 10),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CommonView.productDetailsLeftRightData(StringRes.price1, "B2,000",
              showColor: widget.i == 2
                  ? ColorRes.lightGreenTxt
                  : ColorRes.primaryColor),
        ],
      ),
    );
  }

  productDetails1(String leftTile, String rightSide) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 7, right: 7),
      child: Row(
        children: <Widget>[
          Expanded(
            child: AllText(
              leftTile,
              color: ColorRes.blackColor,
            ),
          ),
          Expanded(
            child: AllText(rightSide,
                align: TextAlign.end, color: ColorRes.blackColor),
          ),
        ],
      ),
    );
  }

  productDetailsView1() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Text('NANKA AS 2+ - 205/5RR/A'),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                width: Utils.getDeviceWidth(context) / 3.3,
                child:
                Image.asset(Utils.getAssetsImg('tiers'), fit: BoxFit.fill),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    CommonView.productDetailsLeftRightData(
                        StringRes.brand, "Micheline"),
                    SizedBox(height: 2),
                    CommonView.productDetailsLeftRightData(
                        StringRes.pageWidth, "199mm"),
                    SizedBox(height: 2),
                    CommonView.productDetailsLeftRightData(
                        StringRes.seriesNumber, "55"),
                    SizedBox(height: 2),
                    CommonView.productDetailsLeftRightData(
                        StringRes.edgeRubber, "51'"),
                    SizedBox(height: 2),
                    CommonView.productDetailsLeftRightData(
                        StringRes.sidewall, "10.72 cm"),
                    SizedBox(height: 10),
                    Divider(
                      height: 5,
                      color: ColorRes.greyColor,
                    ),
                    productDetails(StringRes.count, "x1"),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  statusShow1() {
    return Container(
//      height: 50,
      color: ColorRes.lightWhite,
      padding: EdgeInsets.only(left: 15, right: 10, bottom: 10, top: 10),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CommonView.productDetailsLeftRightData(StringRes.price1, "B2,000",
              showColor: widget.i == 2
                  ? ColorRes.lightGreenTxt
                  : ColorRes.primaryColor),
        ],
      ),
    );
  }

  productPriceView() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      margin: EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AllText("Summery to be paid", fontSize: 17, color: ColorRes.blackColor),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child:CommonView.productDetailsLeftRightData(StringRes.price, 'B2,000'),

          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child:CommonView.productDetailsLeftRightData(StringRes.sectionAA, '-'),

          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child:CommonView.productDetailsLeftRightData(StringRes.shipping, 'B200'),

          ),

          Padding(
              padding: EdgeInsets.only(top: 5),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AllText(StringRes.Amount, color: ColorRes.blackColor),
                      AllText('\B4,200',
                          align: TextAlign.right,
                          color: ColorRes.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AllText('', color: ColorRes.blackColor),
                        AllText('Payment due: 30/6/20',
                            align: TextAlign.right,
                            color: ColorRes.lightRedTxt,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  bottomButton() {
    return Container(
        color: ColorRes.whiteColor,
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
        child: MaterialButton(
          minWidth: Utils.getDeviceWidth(context),
          height: 50,
          onPressed: () {
            paymentSuccessScreenNavigator(context);

          },
          child: AllText(
            StringRes.paymentBillingBtn,
            color: ColorRes.whiteColor,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(color: ColorRes.primaryColor)),
          color: ColorRes.primaryColor,
        ));
  }
}
