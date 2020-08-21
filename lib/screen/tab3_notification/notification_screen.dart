import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/tab3_notification/tab1_all/all_notification_screen.dart';
import 'package:ChaiChod/screen/tab3_notification/tab2_shipment/shipment_screen.dart';
import 'package:ChaiChod/screen/tab3_notification/tab3_payment/payment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  final controller = PageController();
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.lightWhite,
      body: Column(
        children: <Widget>[
          SizedBox(height: 40),
          textTitle(),
          SizedBox(height: 10),
//          tabBar(),
          SizedBox(height: 5),
          Container(
            color: ColorRes.lightWhite,
            height: Utils.getDeviceHeight(context) / 12,
            child: TabBar(
              indicatorColor: ColorRes.primaryColor,
              labelColor: ColorRes.primaryColor,
              isScrollable: false,
              labelStyle: TextStyle(color: ColorRes.primaryColor),
              tabs: <Tab>[
                Tab(
                    child: AllText(StringRes.all, fontSize: 17, color: ColorRes.primaryColor)),
                Tab(
                    child: AllText(StringRes.shipment, fontSize: 17, color: ColorRes.primaryColor)),
                Tab(
                    child: AllText(StringRes.payment, fontSize: 17, color: ColorRes.primaryColor)),
              ],
              controller: _tabController,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                AllNotificationScreen(),
                ShipmentScreen(),
                PaymentScreen()
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }

  textTitle() {
    return Container(
      alignment: Alignment.center,
      child: AllText(
        StringRes.NotificationHeading,
        color: ColorRes.blackColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  tabBar() {
    return Container(
      child: new DefaultTabController(
        length: 3,
        child: new Column(
          children: <Widget>[
            new Container(
              width: 1200.0,
              child: new Container(
                color: Colors.white60,
                child: new TabBar(
                  indicatorColor: ColorRes.primaryColor,
//                  indicatorSize:,
                  labelColor: ColorRes.primaryColor,
                  tabs: [
                    Tab(
                      child:
                          new Text("All", style: new TextStyle(fontSize: 17.0)),
                    ),
                    Tab(
                      child: new Text("Shipment",
                          style: new TextStyle(fontSize: 17.0)),
                    ),
                    Tab(
                      child: new Text("Payment",
                          style: new TextStyle(fontSize: 17.0)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
