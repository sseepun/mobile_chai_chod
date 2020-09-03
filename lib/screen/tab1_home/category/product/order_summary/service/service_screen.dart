import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/tab1_home/category/product/order_summary/service/shipping/shipping_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../order_summary_screen.dart';

class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final controller = PageController();
  String radioItem = '';

  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _appBar(),
              SizedBox(height: 2),
              serviceDetails(),
              Divider(height: 1, color: ColorRes.greyColor),
              discountDetails(),
              Divider(height: 1, color: ColorRes.greyColor),
              productPriceView(),
              bottomButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Column(
      children: <Widget>[
       Stack(
          alignment: Alignment.center,
//      mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkResponse(
              onTap: () {
                navigatorPop(context);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 15,top: 20),
                child: Icon(
                  Icons.arrow_back,
                  color: ColorRes.blackColor,
                  size: 25,
                ),
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 25, bottom: 5,left: 45),
                child: Flexible(
                  child: AllText(
                    StringRes.serviceTitle,
                    maxLine: 1,
                    overflow: TextOverflow.ellipsis,
                    color: ColorRes.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),

        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 5, bottom: 15),
          child: AllText(
            StringRes.serviceTitle1,
            color: ColorRes.blackColor,
            fontSize: 15,
          ),
        ),
        Divider(
          color: ColorRes.greyColor,
          height: 5,
        )
      ],
    );
  }

  serviceDetails() {
    return Container(
        height: 350,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, top: 10),
              child: AllText(
                StringRes.serviceDes1,
                color: ColorRes.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
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
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(left: 10, top: 20),
                    child: AllText(
                      StringRes.serviceDes2,
                      color: ColorRes.blackColor,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 130),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShippingScreen()),
                          );
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 25,
                          color: ColorRes.primaryColor,
                        )),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                RadioListTile(

                  groupValue: radioItem,
                  title: Text('Free installation (C Service Area)',style: TextStyle(fontSize: 14),),
                  value: 'Item 1',
                  onChanged: (val) {
                    setState(() {

                      radioItem = val;
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.only(left: 70),
                  child: Text('Bangkok, Maha Sarakham, Samut Prakan, Pathum Thani, Nonthaburi, Nakhon Pathom and Samut Sakhon',style: TextStyle(fontSize: 12),),
                ),
                RadioListTile(
                  groupValue: radioItem,
                  title: Text('Free private transport (not installed)',style: TextStyle(fontSize: 14),),
                  value: 'Item 2',
                  onChanged: (val) {
                    setState(() {
                      radioItem = val;
                    });
                  },
                ),

                RadioListTile(
                  groupValue: radioItem,
                  title: Text('Delivery outside the area, installation service free)',style: TextStyle(fontSize: 14),),
                  value: 'Item 3',
                  onChanged: (val) {
                    setState(() {
                      radioItem = val;
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.only(right: 30),
                  child: Text('* There is a transportation fee.',style: TextStyle(fontSize: 14,color: Colors.red)),
                ),
              ],
            ),
          ],
        ));
  }

  discountDetails(){
    return Container(
        height: 110,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, top: 10),
              child:AllText(
                StringRes.serviceDescription,
                color: ColorRes.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:10,left: 10),
              child: Row(
                children: <Widget>[
                  Container(
                      height: 50,
                      width: 290,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorRes.primaryColor,
                          )),
                      child: FlatButton(
                       padding: EdgeInsets.only(right: 80),
                        color: ColorRes.whiteColor,
                        child: AllText(
                          StringRes.discountServiceBtn1,
                          fontSize: 15,
                          color: ColorRes.primaryColor,
                        ),
                        onPressed: () {
                        },
                      )),
                  Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.only(),
                      child: FlatButton(
                        padding: EdgeInsets.only(right: 3),
                        color: ColorRes.primaryColor,
                        child: Icon(
                          Icons.calendar_today,
                          color: ColorRes.whiteColor,
                        ),
                        onPressed: () {
                        },
                      )),
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
          productPriceShow(StringRes.price, 'B2,000'),
          productPriceShow(StringRes.sectionAA, 'B0'),
          productPriceShow(StringRes.shipping, 'B0'),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AllText(StringRes.total, color: ColorRes.blackColor),
                AllText('\$2,000',
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
