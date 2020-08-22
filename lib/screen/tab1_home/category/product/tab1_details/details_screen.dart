import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                      child:listData()
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


  listData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top:20,left: 10),
              child: Text(
                StringRes.Title1,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top:10,left: 10, right: 10),
              child: Text(
                StringRes.Description,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:10,left: 7),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.check_circle,
                    size: 25,
                    color: ColorRes.primaryColor,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 7),
                    child:AllText(
                      "Qualifications",
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:10,left: 7),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.check_circle,
                    size: 25,
                    color: ColorRes.primaryColor,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 7),
                    child:AllText(
                      "Qualifications",
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:10,left: 7),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.check_circle,
                    size: 25,
                    color: ColorRes.primaryColor,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 7),
                    child:AllText(
                      "Qualifications",
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Image.asset(
                Utils.getAssetsImg('productimge2'),
                height: 200,
                width: 300,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top:10,left: 10, right: 10),
              child: Text(
                StringRes.Description1,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
