import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../aboutus_screen.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final controller = PageController();

  List<String> images = [
    Utils.getAssetsImg('facebooklogo'),
    Utils.getAssetsImg('linelogo'),
    Utils.getAssetsImg('emaillogo'),
    Utils.getAssetsImg('calllogo'),
  ];

  List<String> stringList1 = [
    'Facebook',
    'LINE',
    'Email',
    'Tel No.',
  ];

  List<String> stringList2 = [
    'facebook/chaichod',
    '@chaichod',
    'chaichod@gmail.com',
    '02-301-2312',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                textTitle(),
                Container(
                  margin:
                      EdgeInsets.only(top: 80, left: 10, right: 10, bottom: 10),
                  child: contactDetails(),
                ),
                Container(
                  margin: EdgeInsets.only(top: 60),
                  child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return listData(index);
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 370, left: 10, right: 10, bottom: 10),
                  child: descriptionContainer(),
                ),
                Container(
                  margin: EdgeInsets.only(top: 380),
                  child: description(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  textTitle() {
    return Container(
        color: ColorRes.primaryColor,
        height: 200,
        padding: EdgeInsets.only(bottom: 100),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUsScreen()),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Colors.white,
                  )),
            ),
            Container(
              padding: EdgeInsets.only(left: 100),
              child: AllText(
                StringRes.contactUs,
                color: ColorRes.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }

  contactDetails() {
    return Container(
      alignment: Alignment.center,
      height: 280,
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
    );
  }

  listData(int index) {
    return Container(
        height: 70,
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(offset: Offset(0.1, 0.1), color: Colors.black12),
          ],
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 45,
                    height: 45,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                    ),
                    child: Image.asset(images[index], height: 20, width: 20),
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          stringList1[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          stringList2[index],
                          style: TextStyle(
                            color: ColorRes.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  descriptionContainer() {
    return Container(
      alignment: Alignment.center,
      height: 280,
      decoration: new BoxDecoration(
        boxShadow: [
          new BoxShadow(offset: Offset(0.1, 0.1), color: Colors.black12),
        ],
        borderRadius: BorderRadius.all(Radius.circular(7)),
        color: Colors.white,
      ),
    );
  }

  description() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10),
          child: CommonView.logoImage(220, 80),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top:10,left: 20, right: 20),
          child: AllText(
            StringRes.description,
            color: ColorRes.blackColor,
            fontSize: 15,
          ),
        ),
      ],
    ));
  }
}
