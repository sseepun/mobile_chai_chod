import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/tab1_home/category/product/order_summary/service/service_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../product_screen.dart';
import '../../order_summary_screen.dart';
import 'delivery_address/delivery_address_screen.dart';

class ShippingScreen extends StatefulWidget {
  @override
  _ShippingScreenState createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen>
    with SingleTickerProviderStateMixin {
  final controller = PageController();
  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
        bottom: false,
      child: Scaffold(
        backgroundColor: ColorRes.whiteColor,
        body: Container(
         child: Column(
           children: [
             _appBar(),

             SingleChildScrollView(
               child: Stack(
                 children: <Widget>[
                   Container(
                       child: Column(
                         children: <Widget>[

                           SizedBox(height: 10),
                           serviceDetails(),
                           SizedBox(height: 30),
                           bottomButton(),
                         ],
                       )),
                 ],
               ),
             ),
           ],
         ),
        )

      ),
        ), );
  }

  Widget _appBar() {
    return Align(
      alignment: Alignment.center,
      child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 50,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 17,left: 10),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        /*  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderSummaryScreen()),
                          );*/
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(left: 50, top: 10),
                    child: AllText(
                      StringRes.shippingTitle,
                      color: ColorRes.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 10),
                child: AllText(
                  StringRes.shippingTitle1,
                  color: ColorRes.blackColor,
                  fontSize: 15,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 25, left: 10, right: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 4, bottom: 30),
                              height: 60,
                              decoration: new BoxDecoration(
                                border: Border.all(color: Colors.black45),
                                borderRadius:
                                BorderRadius.all(Radius.circular(2)),
                              ),
                            ),
                            Padding(

                              padding: EdgeInsets.only(left: 10, top: 10),
                              child:  AllText(
                                StringRes.shippingDes1,
                                color: ColorRes.blackColor,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        )),
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 4, bottom: 30),
                            height: 60,
                            decoration: new BoxDecoration(
                              border: Border.all(color: Colors.black45),
                              borderRadius: BorderRadius.all(Radius.circular(2)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child:  AllText(
                              StringRes.shippingDes2,
                              color: ColorRes.blackColor,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  // service details are use in forward arrow to the next screen
  serviceDetails() {
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, top: 10),
              child: AllText(
                StringRes.shippingDescription1,
                color: ColorRes.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkResponse(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DeliveryAddressScreen()),
                );
              },
              child: Container(
                height: 60,
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: new BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                      offset: Offset(0.5, 0.5),
                      color: ColorRes.greyColor,
                      blurRadius: 0.9,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(left: 10, top: 20),
                      child: AllText(
                        StringRes.shippingDescription2,
                        color: ColorRes.blackColor,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(right: 10),
//                      padding: EdgeInsets.only(left: 120),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 25,
                        color: ColorRes.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  bottomButton() {
    return  Container(
      margin: EdgeInsets.only(left:10,right:10, bottom: 10),
      alignment: Alignment.center,
      width: Utils.getDeviceWidth(context),
      height: 45,
      decoration: new BoxDecoration(
        color:Color(hexColor('#E0E0E0')),
        borderRadius: BorderRadius.all(Radius.circular(2)),
        boxShadow: [
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      ),
      child: AllText(
        StringRes.continueText,
        fontSize: 15,
        align: TextAlign.center,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
