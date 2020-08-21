import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_us/contactus_screen.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final controller = PageController();

  List<IconData> icons = [
    Icons.call,
    Icons.calendar_view_day,
    Icons.local_printshop
  ];

  List<String> stringList = [
    'Contact us',
    'About us',
    'Privacy policy',
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
                itemCount: 3,
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
        StringRes.aboutUs,
        color: ColorRes.blackColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  listData(int index) {
    return Container(
        height: 55,
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUsScreen()),
                );
              },
              child:  Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 40,
                      height: 40,
                      decoration: new BoxDecoration(
                        color: ColorRes.lightBlur,
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                      ),
                      child:Icon(icons[index],
                          size: 20, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 0, left: 10),
                    child: Text(
                      stringList[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            )

          ],
        ));
  }
}
