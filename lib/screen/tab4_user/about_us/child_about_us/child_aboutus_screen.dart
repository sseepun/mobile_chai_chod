import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../aboutus_screen.dart';

class ChildAboutUsScreen extends StatefulWidget {
  @override
  _ChildAboutUsScreenState createState() => _ChildAboutUsScreenState();
}

class _ChildAboutUsScreenState extends State<ChildAboutUsScreen> {
  final controller = PageController();

  List<String> images = [
    Utils.getAssetsImg('about_car1'),
    Utils.getAssetsImg('about_car2'),
  ];

  List<String> stringList1 = [
    StringRes.description,
    StringRes.description1,
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
                 padding: EdgeInsets.only(top: 50),
                 child:ListView.builder(
                     itemCount: 2,
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemBuilder: (context, index) {
                       return listData(index);
                     }),
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
                StringRes.aboutUs,
                color: ColorRes.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }

  listData(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 10,bottom: 10),
              child: Image.asset(images[index], height: 160, width: 330,fit: BoxFit.fill),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                stringList1[index],
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ],
    );

  }
}
