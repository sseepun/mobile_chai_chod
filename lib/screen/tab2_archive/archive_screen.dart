import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/config/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tab1_shipping/shipping_screen.dart';
import 'tab2_successfully/successful_delivery_screen.dart';

class ArchiveScreen extends StatefulWidget {
  @override
  _ArchiveScreenState createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> with SingleTickerProviderStateMixin  {
  final controller = PageController();

  TabController _tabController;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);

}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.bgColor,
        body: Column(
          children: <Widget>[
            CommonView.titleText(StringRes.archiveHeading),
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
                  Tab(child: Text(StringRes.shipping)),
                  Tab(child: Text(StringRes.successDelivery)),
                ],
                controller: _tabController,
              ),
            ),
            SizedBox(height: 10),
            //show the tab bar
            Expanded(
              child: TabBarView(
                children: [
                  ShippingScreen(),
                  SuccessfulDeliveryScreen(),
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
