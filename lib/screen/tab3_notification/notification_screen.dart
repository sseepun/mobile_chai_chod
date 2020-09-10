import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/config/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tab1_all/all_notification_screen.dart';
import 'tab3_payment/payment_screen.dart';
import '../tab4_user/order_history/shipment_screen.dart';

class NotificationScreen extends StatefulWidget {

  final int i;
  const NotificationScreen({Key key, this.i}) : super(key: key);

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.bgColor,
        body: Column(
          children: <Widget>[
            CommonView.titleText(StringRes.notificationHeading),
            SizedBox(height: 20),
            Container(
              height: 50,
              child: TabBar(
                indicatorColor: ColorRes.primaryColor,
                indicatorWeight: 4,
                labelColor: ColorRes.primaryColor,
                unselectedLabelColor: Colors.grey,
                isScrollable: false,
                labelStyle: AppTheme.tabTextStyle,
                tabs: <Tab>[
                  Tab(child: Text(StringRes.all)),
                  Tab(child: Text(StringRes.shipment)),
                  Tab(child: Text(StringRes.payment)),
                ],
                controller: _tabController,
              ),
            ),
            SizedBox(height: 10),
            // tab bar view are use in other screen
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
      ),
    );
  }

}
