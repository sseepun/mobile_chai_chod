import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabbar/tabbar.dart';

class ArchiveScreen extends StatefulWidget {
  @override
  _ArchiveScreenState createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: new Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  textFiled(),

                  SizedBox(height: 20),
                  tabBar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  textFiled() {
    return Container(
      alignment: Alignment.center,
      child: AllText(
        StringRes.ArchiveHeading,
        color: ColorRes.blackColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  tabBar(){
    return Container(
     child: new DefaultTabController(
        length: 2,
        child: new Column(
          children: <Widget>[
            new Container(
              width: 1200.0,
              child: new Container(
                color: Colors.white,
                child: new TabBar(
                  indicatorColor: ColorRes.primaryColor,
//                  indicatorSize:,
                  labelColor: ColorRes.primaryColor,
                  tabs: [
                    Tab(
                      child: new Text("Shipping",
                          style: new TextStyle(fontSize: 17.0)
                      ),
                    ),
                    Tab(
                      child: new Text("Successful delivery",
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
