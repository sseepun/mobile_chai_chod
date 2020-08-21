import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/screen/tab4_user/about_us/child_about_us/child_aboutus_screen.dart';
import 'package:ChaiChod/screen/tab4_user/about_us/contact_us/contactus_screen.dart';
import 'package:ChaiChod/screen/tab4_user/about_us/privancy_policy/privacy_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChildSetUpScreen extends StatefulWidget {
  @override
  _ChildSetUpScreenState createState() => _ChildSetUpScreenState();
}

class _ChildSetUpScreenState extends State<ChildSetUpScreen> {
  final controller = PageController();

  List<String> stringList = [
    'Current Address',
  ];
  List<String> stringList1 = [
    '999/9 Naawamin, Bueng Kum, Bangkok, 10330',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            textTitle(),
            SizedBox(height: 10),
            ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return listData(index);
                }),
            SizedBox(height: 400),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(right: 20),
              child:FloatingActionButton(
                backgroundColor: ColorRes.primaryColor,

                onPressed: () {},
                child: Icon(Icons.add,size: 40,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  textTitle() {
    return Container(
        child: Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10),
          child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.arrow_back,
                size: 25,
                color: Colors.black,
              )),
        ),
        Container(
          padding: EdgeInsets.only(left: 120),
          child: AllText(
            StringRes.setUp,
            color: ColorRes.blackColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ));
  }

  listData(int index) {
    return Container(
        height: 90,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 220),
                  child: Text(
                    stringList[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 50),
                  child: Text(
                    stringList1[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
