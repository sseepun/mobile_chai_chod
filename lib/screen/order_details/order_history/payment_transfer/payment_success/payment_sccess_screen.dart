import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/tab1_home/home_screen.dart';
import 'package:ChaiChod/screen/home_tab/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ChaiChod/export.dart';

class PaymentSuccessScreen extends StatefulWidget {
  @override
  _PaymentSuccessScreenState createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  // hex color code
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
                  //payment success screen success image
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

                  //payment success screen Payment Success Title
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: AllText(StringRes.PaymentSuccessTitle,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),

                  //payment success screen Payment Success Description
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

                  //payment success screen Payment Success Description
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: AllText(
                      StringRes.PaymentSuccessDec2,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: ColorRes.primaryColor,
                    ),
                  ),

                  //payment success screen Payment Success Description
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: AllText(
                        StringRes.PaymentSuccessDec3,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  SizedBox(height: 30),

                  //payment success screen Homepage button
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
