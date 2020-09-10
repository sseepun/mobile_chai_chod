import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/config/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_tab/main_screen.dart';

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
    return Container(
      color: Colors.white,
      child: SafeArea(
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
                      width: 140,
                      height: 140,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      StringRes.successMessage,
                      style: AppTheme.headerStyle,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      StringRes.reviewAdmin,
                      style: AppTheme.descStyle,
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                      width: Utils.getDeviceWidth(context) / 1.35,
                      height: 58,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: ColorRes.lightBlur,
                        child: Text(
                          'ตกลง',
                          style: AppTheme.btnTextStyle,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen()
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
