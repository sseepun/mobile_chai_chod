import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/material.dart';
import 'orderdetailsmodel.dart';

class OrderDetailsScreen extends StatefulWidget {
  final int i;

  const OrderDetailsScreen({Key key, this.i}) : super(key: key);

  @override
  OrderDetailsScreenState createState() => OrderDetailsScreenState();
}

class OrderDetailsScreenState extends State<OrderDetailsScreen> {
  OrderDetailsModel model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = OrderDetailsModel(this);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorRes.whiteColor,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                CommonView.backArrowAndTitle(context, StringRes.orderDetailsTitle, ColorRes.blackColor),
                orderNumberShow(),
                statusShow(),
                productDetailsView(),
                Divider(height: 1, color: ColorRes.greyColor),
                detailsView(),
                Divider(height: 1, color: ColorRes.greyColor),
                productPriceView(),
                widget.i == 2 ? bottomButton() : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }


  orderNumberShow() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 5, bottom: 10),
      color: Colors.white,
      child: Text('#111111112222 30/05/2020'),
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
          CommonView.productDetailsLeftRightData(StringRes.status, "Are shopping", showColor: widget.i == 2 ? ColorRes.lightGreenTxt : ColorRes.lightOrangeTxt),
          widget.i == 2 ? CommonView.productDetailsLeftRightData(StringRes.dateReceipt, "30/05/20") : Container()
        ],
      ),
    );
  }

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
                    CommonView.productDetailsLeftRightData(StringRes.brand, "Micheline"),
                    SizedBox(height: 2),
                    CommonView.productDetailsLeftRightData(StringRes.pageWidth, "199mm"),
                    SizedBox(height: 2),
                    CommonView.productDetailsLeftRightData(StringRes.seriesNumber, "Fifty Five"),
                    SizedBox(height: 2),
                    CommonView.productDetailsLeftRightData(StringRes.edgeRubber, "Fifteen"),
                    SizedBox(height: 2),
                    CommonView.productDetailsLeftRightData(StringRes.sidewall, "10.72 cm"),
                    SizedBox(height: 10),

                    Divider(
                      height: 1,
                      color: ColorRes.greyColor,
                    ),
                    productDetails(StringRes.count, "x2"),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  detailsView() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      color: Colors.white,
      width: Utils.getDeviceWidth(context),
      margin: EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
//                      mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AllText(
            "Service, Delivery and Installation",
            color: ColorRes.blackColor,
            fontSize: 20,
          ),
          SizedBox(height: 10),
          AllText("Install, in bed", color: ColorRes.blackColor, fontSize: 18),
          SizedBox(height: 4),
          AllText("At. Pundali, Pathunda, Rani, unny5",
              color: ColorRes.blackColor, fontSize: 16),
          AllText("And... - - - ", color: ColorRes.blackColor, fontSize: 16),
        ],
      ),
    );
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
          CommonView.productDetailsLeftRightData(StringRes.payment, 'World Bank of Thailand'),
          CommonView.productDetailsLeftRightData(StringRes.price, 'B2,000'),
          CommonView.productDetailsLeftRightData(StringRes.sectionAA, 'B0'),
          CommonView.productDetailsLeftRightData(StringRes.shipping, 'B50'),
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

  bottomButton() {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
        child: MaterialButton(
          minWidth: Utils.getDeviceWidth(context),
          height: 50,
          onPressed: () {
            rateProductScreenNavigator(context,2);
          },
          child: AllText(StringRes.rated),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(color: ColorRes.primaryColor)),
          color: ColorRes.whiteColor,
        ));
  }
}
