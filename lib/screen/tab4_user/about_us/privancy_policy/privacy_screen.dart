//import 'package:ChaiChod/common_widget/common_widget.dart';
//import 'package:ChaiChod/common_widget/text.dart';
//import 'package:ChaiChod/config/color_resources.dart';
//import 'package:ChaiChod/config/string_resources.dart';
//import 'package:ChaiChod/config/util.dart';
//import 'package:flutter/material.dart';
//import '../aboutus_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:ChaiChod/export.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
        bottom: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25,
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.white,
          centerTitle:true,
          title: Text(StringRes.privacyPolicy,style: TextStyle(color: Colors.black),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
//                textTitle(),

                  // CommonView.backArrowAndTitle(context, StringRes.privacyPolicy, ColorRes.blackColor),

                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child:listData()
                  ),

                ],
              )
            ],
          ),
        ),
      ),
        ),);
  }

  // textTitle() {
  //   return Container(
  //       padding: EdgeInsets.only(top:30,bottom: 100),
  //       child: Row(
  //         children: <Widget>[
  //           Container(
  //             padding: EdgeInsets.only(left: 10),
  //             child: InkWell(
  //                 onTap: () {
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(builder: (context) => AboutUsScreen()),
  //                   );
  //                 },
  //                 child: Icon(
  //                   Icons.arrow_back,
  //                   size: 25,
  //                   color: Colors.black,
  //                 )),
  //           ),
  //           Container(
  //             padding: EdgeInsets.only(left: 80),
  //             child: AllText(
  //               StringRes.privacyPolicy,
  //               color: ColorRes.blackColor,
  //               fontSize: 20,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ],
  //       ));
  // }

  //list data use in list of privacy screen details
  listData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: AllText(
                StringRes.PrivacyDescription1,
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top:20,left: 10),
              child: Text(
                StringRes.PrivacyTitle1,
                style: TextStyle(
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
                StringRes.PrivacyDescription2,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top:20,left: 10),
              child: Text(
                StringRes.PrivacyTitle2,
                style: TextStyle(
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
                StringRes.PrivacyDescription3,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );

  }
}
