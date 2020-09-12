import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/tab2_archive/tab1_shipping/shipping_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Container(
        color: ColorRes.lightWhite,
        child: SafeArea(
        bottom: false,
      child: Scaffold(
        backgroundColor: ColorRes.lightWhite,
        body: Column(
          children: <Widget>[

            CommonView.titleText(StringRes.archiveHeading),
//            tabBar(),
            Container(
              color: ColorRes.lightWhite,
              height: Utils.getDeviceHeight(context)/12,
              child: TabBar(
                indicatorColor: ColorRes.primaryColor,
                labelColor: ColorRes.primaryColor,
                isScrollable: false,
                labelStyle: TextStyle(color: ColorRes.primaryColor),
                tabs: <Tab>[
                  Tab(child: AllText(StringRes.shipping, fontSize: 17,  color: ColorRes.primaryColor)),
                  Tab(child: AllText(StringRes.successDelivery, fontSize: 17, color: ColorRes.primaryColor)),
                ],
                controller: _tabController,
              ),
            ),
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
        ),);
  }

  //tab bar heading
  /*tabBar(){
    return DefaultTabController(
        length: 2,
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
                  tabs: [Tab(
                    child: new Text("Shipping", style: new TextStyle(fontSize: 17.0)
                    ),
                  ),
                    Tab(
                      child: new Text("Successful delivery", style: new TextStyle(fontSize: 17.0)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  }*/


}
