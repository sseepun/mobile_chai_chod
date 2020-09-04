import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/tab1_home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatefulWidget {
  @override
  _PaymentSuccessScreenState createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
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
                  Container(
                    padding: EdgeInsets.only(top: 0),
                    alignment: Alignment.center,
                    child: Image.asset(
                      Utils.getAssetsImg('success'),
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: AllText(StringRes.PaymentSuccessTitle,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child:Container(
                      margin: EdgeInsets.only(left:20,right:20,top: 30),
                      child: AllText(
                          StringRes.PaymentSuccessDec1,
                          fontSize: 16,
                          color: Colors.black),
                    ),

                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: AllText(
                      StringRes.PaymentSuccessDec2,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: ColorRes.primaryColor,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: AllText(
                        StringRes.PaymentSuccessDec3,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  SizedBox(height: 30),
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
                                builder: (context) => HomeScreen()),
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
}
