import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabbar/tabbar.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
                  SizedBox(height: 5),
                  card2(),
                  SizedBox(height: 5),
                  card3(),
                  SizedBox(height: 5),
                  card4(),
                  SizedBox(height: 5),
                  card5(),
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
        StringRes.NotificationHeading,
        color: ColorRes.blackColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  tabBar(){
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
                  tabs: [Tab(
                    child: new Text("All", style: new TextStyle(fontSize: 17.0)
                    ),
                  ),
                    Tab(
                      child: new Text("Shipment", style: new TextStyle(fontSize: 17.0)),
                    ),
                    Tab(
                      child: new Text("Payment", style: new TextStyle(fontSize: 17.0)),
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
                    padding: EdgeInsets.only(top: 15,left: 20),
                  ),
                  Container(
                    height: 6,
                    width: 6,
                    decoration: new BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(
                    "Prepare to pay,billing",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Colors.pink,
                      fontSize: 14,
                    ),
                  ),

                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(top: 15,left: 130),
                    child: Text(
                      "15 OOu.",
                      style: TextStyle(
                        fontFamily: 'Roboto',
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
                      "Order number #9138123",
                      style: TextStyle(
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

  card2(){
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
                      "Delivery of product to you..",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(top: 15,left: 95),
                    child: Text(
                      "11 OOu.",
                      style: TextStyle(
                        fontFamily: 'Roboto',
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
                      "Order now at #1003111124",
                      style: TextStyle(
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

  card3(){
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
                      "Successful delivery",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(top: 15,left: 130),
                    child: Text(
                      "31/05/20",
                      style: TextStyle(
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
                      "Order now at #1003111124",
                      style: TextStyle(
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

  card4(){
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
                      "Successful delivery",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(top: 15,left: 130),
                    child: Text(
                      "31/05/20",
                      style: TextStyle(
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
                      "Order now at #1003111124",
                      style: TextStyle(
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

  card5(){
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
                      "Successful delivery",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,

                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(top: 15,left: 130),
                    child: Text(
                      "31/05/20",
                      style: TextStyle(
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
                      "Order now at #1003111124",
                      style: TextStyle(
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
