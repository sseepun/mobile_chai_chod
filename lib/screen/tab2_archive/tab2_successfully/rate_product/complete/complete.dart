import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/home_tab/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompleteScreen extends StatefulWidget {
  final int i;

  const CompleteScreen({Key key, this.i}) : super(key: key);

  @override
  _CompleteScreenState createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorRes.whiteColor,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  rateCard(),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: AllText(StringRes.CompleteTitle,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: ColorRes.primaryColor),
                  ),
                  Container(
                    alignment: Alignment.center,

                    padding: EdgeInsets.only(left:100,top: 20),
                    child: AllText(StringRes.CompleteTitle1,
                        fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(height: 50),
                  Container(
                    child: Container(
                      width: Utils.getDeviceWidth(context) / 1.35,
                      height: 45,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: ColorRes.lightBlur,
                        child: Text('Back to homepage'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  rateCard() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 35,left: 50),
            child: Icon(
              Icons.star,
              size: 70,
              color: Colors.yellow.shade800,
            ),
          ),
          Icon(
            Icons.star,
            size: 130,
            color: Colors.yellow.shade800,
          ),
          Container(
            padding: EdgeInsets.only(top: 35),
            child: Icon(
              Icons.star,
              size: 70,
              color: Colors.yellow.shade800,
            ),
          ),
        ],
      ),
    );
  }
}
