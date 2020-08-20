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
      backgroundColor: Colors.white60,
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

                  SizedBox(height: 20),
                  card1(),
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
      ),
    );
  }

  card1(){
    return Container(
      child: Container(
          width: 345,
          height: 75,
          decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                offset: Offset(-5.0, 0.0),
                color: Color(0xffEDEDED),
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 15,left: 20),
                    child: Text(
                      "Order number",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(top: 15,left: 140),
                    child: Text(
                      "#1003111124",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 15,left: 20),
                    child: Text(
                      "Order date",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(top: 15,left: 190),
                    child: Text(
                      "30/05/20",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}
