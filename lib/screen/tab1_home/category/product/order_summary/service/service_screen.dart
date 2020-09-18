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

  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  bool isSelected = true;
  bool isDealerDetails = false;
  bool isGeneralUser = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
        bottom: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70), // here the desired height
          child: AppBar(
            elevation: 0.0,

            leading: IconButton(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 20, left: 5),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25,
              ),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            title: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5,right: 10),
                    child: Text(StringRes.serviceTitle,
                        style: TextStyle(color: ColorRes.blackColor)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5,right: 25),
                    child: Text(StringRes.serviceTitle1,
                        style: TextStyle(color: Colors.black38, fontSize: 15)),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
//            title: CommonView.appBarTitle(context, StringRes.shoppingCart),
            centerTitle: true,
          ),
        ),

        backgroundColor: ColorRes.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // _appBar(),
              SizedBox(height: 2),
              Visibility(
                visible: true,
                child: serviceDetails(),
              ),
              Divider(height: 1, color: ColorRes.greyColor),
             /* Visibility(
                visible: true,
                child: service(),
              ),*/
              Divider(height: 1, color: ColorRes.greyColor),
              discountDetails(),
              Divider(height: 1, color: ColorRes.greyColor),
              productPriceView(),
              bottomButton(),
            ],
          ),
        ),
      ),
        ),);
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
                padding: EdgeInsets.only(left: 10, top: 20),
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
                margin: EdgeInsets.only(top: 25, bottom: 5, left: 45),
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

  //service details are use in radio list tile and change color bottom button
  serviceDetails() {
    return Container(
        height: 400,
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
            InkResponse(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShippingScreen()),
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
                      padding: EdgeInsets.only(left: 10, top: 20, right: 10),
                      child: AllText(
                        StringRes.serviceDes2,
                        color: ColorRes.blackColor,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
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
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        if (!isGeneralUser) {
                          isGeneralUser = !isGeneralUser;
                        } else {
                          isDealerDetails = !isDealerDetails;
                        }
                      },
                    );
                  },
                  child: RadioListTile(
                    groupValue: radioItem,
                    title: Text(
                      'Free installation (C Service Area)',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: 'Item 1',
                    onChanged: (val) {
                      setState(() {
                        radioItem = val;
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 70),
                  child: Text(
                    'Bangkok, Maha Sarakham, Samut Prakan, Pathum Thani, Nonthaburi, Nakhon Pathom and Samut Sakhon',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                GestureDetector(
                  child: RadioListTile(
                    groupValue: radioItem,
                    title: Text(
                      'Free private transport (not installed)',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: 'Item 2',
                    onChanged: (val) {
                      setState(() {
                        radioItem = val;
                      });
                    },
                  ),
                ),
                GestureDetector(
                  child: RadioListTile(
                    groupValue: radioItem,
                    title: Text(
                      'Delivery outside the area, installation service free)',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: 'Item 3',
                    onChanged: (val) {
                      setState(() {
                        radioItem = val;
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 30),
                  child: Text('* There is a transportation fee.',
                      style: TextStyle(fontSize: 14, color: Colors.red)),
                ),
              ],
            ),
          ],
        ));
  }

  service() {
    return Container(
        height: 400,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
                height: 120,
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
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: AllText(
                        StringRes.serviceVisible1,
                        color: ColorRes.blackColor,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: AllText(
                        StringRes.serviceVisible2,
                        color: ColorRes.blackColor,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: AllText(
                            StringRes.serviceVisible3,
                            color: ColorRes.blackColor,
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          height: 50,
                          padding: EdgeInsets.only(left: 5),
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
                  ],
                )),
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        if (!isGeneralUser) {
                          isGeneralUser = !isGeneralUser;
                        } else {
                          isDealerDetails = !isDealerDetails;
                        }
                      },
                    );
                  },
                  child: RadioListTile(
                    groupValue: radioItem,
                    title: Text(
                      'Free installation (C Service Area)',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: 'Item 1',
                    onChanged: (val) {
                      setState(
                        () {
                          radioItem = val;
                        },
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 70),
                  child: Text(
                    'Bangkok, Maha Sarakham, Samut Prakan, Pathum Thani, Nonthaburi, Nakhon Pathom and Samut Sakhon',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                GestureDetector(
                  child: RadioListTile(
                    groupValue: radioItem,
                    title: Text(
                      'Free private transport (not installed)',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: 'Item 2',
                    onChanged: (val) {
                      setState(() {
                        radioItem = val;
                      });
                    },
                  ),
                ),
                GestureDetector(
                  child: RadioListTile(
                    groupValue: radioItem,
                    title: Text(
                      'Delivery outside the area, installation service free)',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: 'Item 3',
                    onChanged: (val) {
                      setState(() {
                        radioItem = val;
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 30),
                  child: Text('* There is a transportation fee.',
                      style: TextStyle(fontSize: 14, color: Colors.red)),
                ),
              ],
            ),
          ],
        ));
  }

  discountDetails() {
    return Container(
        height: 110,
        width: Utils.getDeviceWidth(context),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, top: 10),
              child: AllText(
                StringRes.serviceDescription,
                color: ColorRes.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        height: 50,
//                      width: Utils.getDeviceWidth(context),
                        padding: EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: ColorRes.primaryColor,
                        )),
                        child: FlatButton(
                          color: ColorRes.whiteColor,
                          child: AllText(
                            StringRes.discountServiceBtn1,
                            fontSize: 15,
                            color: ColorRes.primaryColor,
                          ),
                          onPressed: () {},
                        )),
                  ),
                  Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.only(),
                      child: FlatButton(
                        padding: EdgeInsets.only(right: 3),
                        color: ColorRes.primaryColor,
                        child: Icon(
                          Icons.calendar_today,
                          color: ColorRes.whiteColor,
                        ),
                        onPressed: () {},
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
          AllText(title, color: ColorRes.blackColor),
          AllText(details,
              align: TextAlign.right,
              color: showColor != null ? showColor : ColorRes.blackColor),
        ],
      ),
    );
  }

  bottomButton() {
    return InkResponse(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 10),
        alignment: Alignment.center,
        width: Utils.getDeviceWidth(context),
        height: 45,
        decoration: new BoxDecoration(
          color: isGeneralUser || isDealerDetails
              ? ColorRes.primaryColor
              : Color(hexColor('#E0E0E0')),
          borderRadius: BorderRadius.all(Radius.circular(2)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
            ),
          ],
        ),
        child: AllText(
          StringRes.rated,
          color: Colors.white,
        ),
      ),
    );
  }
}
