import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final controller = PageController();

  List<String> stringList = ['Prepare to pay,billing','Delivery of product to you..' ,'Successful delivery', 'Successful delivery', 'Successful delivery'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            textTitle(),

            SizedBox(height: 20),
            tabBar(),

            SizedBox(height: 20),

            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
              return listData(index);
            }),

          ],
        ),
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

  listData(int index){
    return Container(
        height: 75,
        margin: EdgeInsets.only(left: 10, bottom: 10, right: 10),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(right: 0,left: 15),
                  child: Text( stringList[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: colorShow(index),
                      fontSize: 14,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Text(
//                    "15 OOu.",
                    "31/05/20",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: AllText(
                "Order number #9138123",
                color: Colors.black,
                fontSize: 14,
                align: TextAlign.left,
              ),
            ),
          ],
        )
    );
  }



  colorShow(int index) {
    if(index == 0) {
      return Colors.pink;
    } else if(index == 1) {
      return Colors.orange;
    } else {
      return ColorRes.blackColor;
    }
  }

}
