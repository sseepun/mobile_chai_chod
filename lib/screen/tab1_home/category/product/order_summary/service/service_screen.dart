import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../order_summary_screen.dart';

class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.lightWhite,
        body: SingleChildScrollView(
          child: Column(
           children: <Widget>[
             _appBar(),
             SizedBox(height: 2,),
             serviceDetails(),
           ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
        height: 100,
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
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: AllText(
                    StringRes.serviceTitle,
                    color: ColorRes.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 10),
              child: AllText(
                StringRes.serviceTitle1,
                color: ColorRes.blackColor,
                fontSize: 15,
              ),
            ),
          ],
        ));
  }
  serviceDetails(){
    return Container(
        height: 100,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, top: 10),
              child:AllText(
                StringRes.serviceDes1,
                color: ColorRes.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child:AllText(
                    StringRes.serviceDes2,
                    color: ColorRes.blackColor,
                    fontSize: 15,
                  ),
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.only(left:15,top: 17),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ServiceScreen()),
                        );
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 25,
                        color: ColorRes.primaryColor,
                      )),
                ),],
            ),

          ],
        ));
  }
}
