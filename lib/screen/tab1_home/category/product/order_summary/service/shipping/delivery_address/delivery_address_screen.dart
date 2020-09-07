import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/tab1_home/category/product/order_summary/service/service_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../order_summary_screen.dart';
import '../shipping_screen.dart';
import 'location/loaction_search_screen/loaction_search_screen.dart';

class DeliveryAddressScreen extends StatefulWidget {
  final int i;
  const DeliveryAddressScreen({Key key, this.i}) : super(key: key);
  @override
  _DeliveryAddressScreenState createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  final controller = PageController();
  List<String> stringList = [
    'Address 1',
    'Address 2',
  ];
  List<String> stringList1 = [
    '999/9 Nawamin, Bueng Kum, Bangkok, 10330',
    '123/1 Rawadee 29, Talat Khwan, Muang Nonthaburi, Nonthaburi 11000',

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.whiteColor,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                  child: Column(
                children: <Widget>[
                  _appBar(),
                  SizedBox(height: 30),
                  ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return listData(index);
                      }),
                  serviceDetails(),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 50,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(top: 17),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderSummaryScreen()),
                        );
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.black,
                      )),
                ),
                Container(
                  padding: EdgeInsets.only(left: 80, top: 10),
                  child: AllText(
                    StringRes.DeliveryAddressTitle,
                    color: ColorRes.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  listData(int index) {
    return InkResponse(
      onTap: () {
        if (index == 0) {
        } else if (index == 1) {}
      },
      child: Container(
        height: 100,
        margin: EdgeInsets.only(left: 10, bottom: 10, right: 10),
        padding: EdgeInsets.only(left: 0, bottom: 10, right: 0, top: 10),
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              offset: Offset(0.5, 0.5),
              color: ColorRes.greyColor,
              blurRadius: 0.5,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 7,left: 10),
              child: AllText(
                stringList[index],
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10,left: 10),
              child: AllText(
                stringList1[index],
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }

  serviceDetails() {
    return Container(

      color: Colors.white,
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
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(left: 10, top: 20),
              child: AllText(
                StringRes.DeliveryAddressDescription1,
                color: ColorRes.blackColor,
                fontSize: 15,
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 160),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Search()),
                    );                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 25,
                    color: ColorRes.primaryColor,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
