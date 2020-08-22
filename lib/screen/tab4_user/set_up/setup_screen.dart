import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/screen/tab4_user/about_us/child_about_us/child_aboutus_screen.dart';
import 'package:ChaiChod/screen/tab4_user/about_us/contact_us/contactus_screen.dart';
import 'package:ChaiChod/screen/tab4_user/about_us/privancy_policy/privacy_screen.dart';
import 'package:ChaiChod/screen/tab4_user/set_up/password/password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../user_screen.dart';
import 'child_setup/child_setup_screen.dart';
import 'launguage/language.dart';

class SetUpScreen extends StatefulWidget {
  @override
  _SetUpScreenState createState() => _SetUpScreenState();
}

class _SetUpScreenState extends State<SetUpScreen> {
  final controller = PageController();

  List<IconData> icons = [
    Icons.location_on,
    Icons.translate,
    Icons.track_changes
  ];

  List<String> stringList = [
    'Address',
    'Language',
    'Change password',
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
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10),
              child: InkWell(
                  onTap: () {

                  },
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
        ),
    );
  }

  listData(int index) {
    return InkResponse(
      onTap: () {
        if(index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChildSetUpScreen()),
          );
        } else if(index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Language()),
          );
        } else if(index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>ChangePassword
              ()),
          );
        }
      },
      child:Container(
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
              Row(
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
            ],
          )),
    );
  }
}
