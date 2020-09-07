import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/tab1_home/category/product/order_summary/service/service_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../product_screen.dart';

class OrderSummaryScreen extends StatefulWidget {
  @override
  _OrderSummaryScreenState createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> with SingleTickerProviderStateMixin {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.lightWhite,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _appBar(),
              //product details method are call
              Column(
                children: <Widget>[
                  productDetailsView(),
                  Divider(height: 1, color: ColorRes.greyColor),
                  serviceDetails(),
                  Divider(height: 1, color: ColorRes.greyColor),
                  discountDetails(),
                  Divider(height: 1, color: ColorRes.greyColor),
                  productPriceView(),
                  bottomButton(),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget _appBar() {
    return Container(
//      height: 100,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            CommonView.backArrowAndTitle(context, StringRes.OrderSummaryTitle, ColorRes.blackColor),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 0),
              child:AllText(
                StringRes.OrderSummaryDescription,
                color: ColorRes.blackColor,
                fontSize: 17,
              ),
            ),
          ],
        ));
  }

  productDetails(String leftTile, String rightSide) {
    return Container(
      margin: EdgeInsets.only(top: 7, bottom: 7, right: 7),
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

  productDetailsView() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
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
                    productDetails(StringRes.brand, "Micheline"),
                    productDetails(StringRes.pageWidth, "199mm"),
                    productDetails(StringRes.seriesNumber, "Fifty Five"),
                    productDetails(StringRes.edgeRubber, "Fifteen"),
                    productDetails(StringRes.sidewall, "10.72 cm"),
                    Divider(
                      height: 1,
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

  serviceDetails(){
    return InkResponse(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => ServiceScreen()));
      },
      child: Container(
          height: 100,
          padding: EdgeInsets.only(left: 10, top: 10),
          color: Colors.white,
          child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AllText(
                StringRes.serviceDetails,
                color: ColorRes.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: AllText(
                      StringRes.serviceDetails1,
                      color: ColorRes.blackColor,
                      fontSize: 15,
                      maxLine: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(left:15,top: 17),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 25,
                      color: ColorRes.primaryColor,
                    ),
                  ),],
              ),

            ],
          )),
    );
  }

  discountDetails(){
    return Container(
        height: 130,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, top: 15),
              child:AllText(
                StringRes.discountDetails,
                color: ColorRes.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:5,left: 10, right: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorRes.primaryColor,
                            )),
                        child: FlatButton(
                          color: ColorRes.whiteColor,
                          child: AllText(
                            StringRes.discountDetailsBtn1,
                            fontSize: 15,
                            color: ColorRes.primaryColor,
                          ),
                          onPressed: () {
                          },
                        )),
                  ),
                  Container(
                      height: 50,
                      width: 80,
                      padding: EdgeInsets.only(left: 10),
                      child: FlatButton(
                        color: ColorRes.primaryColor,
                        child: AllText(
                          StringRes.discountDetailsBtn2,
                          fontSize: 14,
                          color: ColorRes.whiteColor,
                        ),
                        onPressed: () {
                        },
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:10,left: 7),
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
                      "Request a tax invoice",
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ));
  }

  productPriceView() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AllText("Summery", fontSize: 17, color: ColorRes.blackColor),
          productPriceShow(StringRes.payment, 'World Bank of Thailand'),
          productPriceShow(StringRes.price, 'B2,000'),
          productPriceShow(StringRes.sectionAA, 'B0'),
          productPriceShow(StringRes.shipping, 'B50'),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AllText(StringRes.total, color: ColorRes.blackColor),
                AllText('\$20050',
                    align: TextAlign.right,
                    color: ColorRes.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ],
            ),
          )
        ],
      ),
    );
  }

  productPriceShow(String title, String details, {Color showColor}) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AllText(title, color: ColorRes.blackColor ),
          AllText(details, align: TextAlign.right, color: showColor != null ? showColor :ColorRes.blackColor  ),
        ],
      ),
    );
  }

  bottomButton() {
    return Container(
      color: Colors.white,
      child:Padding(

          padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
          child: MaterialButton(

            minWidth: Utils.getDeviceWidth(context),
            height: 50,
            onPressed: () {},
            child: AllText(StringRes.rated),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: ColorRes.primaryColor)),
            color: ColorRes.whiteColor,
          )),
    );

  }
}
