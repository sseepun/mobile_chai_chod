import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'file:///C:/live/mobile_chai_chod/lib/screen/register/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../login/login_screen.dart';

class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.whiteColor,
      body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 200),
                  alignment: Alignment.center,
                  child: Image.asset(Utils.getAssetsImg('success'),
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: AllText(
                    StringRes.successMessage,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: AllText(
                        StringRes.reviewAdmin,
                      fontSize: 18,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Container(
                    width: Utils.getDeviceWidth(context) / 1.35,
                    height: 45,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: ColorRes.lightBlur,
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LoginScreen()),
                        );                                  },
                    ),
                  ),
                ),
              ],
            ),
          )
    );
  }

}
