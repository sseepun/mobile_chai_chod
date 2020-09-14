import 'package:ChaiChod/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/app_theme.dart';
import '../login/login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgorPasswordScreenState createState() => _ForgorPasswordScreenState();
}

class _ForgorPasswordScreenState extends State<ForgotPasswordScreen> {
  // hex color code
  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailContoller;
  String email;

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
          backgroundColor: Colors.white,
          body: Center(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: new Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          // method call in Forgot Password screen design
                          forgot(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // Forgot Password screen design
  forgot(){
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Align(

            alignment: Alignment.centerLeft,
           child: IconButton(
             alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25,
              ),
              onPressed: (){
                Navigator.of(context).pop();
              },

            ),

          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Text(
              'ลืมรหัสผ่าน',
              style: AppTheme.headerStyle,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "ระบุอีเมล์ของคุณ",
              style: AppTheme.inputLabelLargeStyle,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 6, bottom: 35),
                        height: 68,
                        decoration: new BoxDecoration(
                          border: Border.all(color: Colors.black45),
                          borderRadius:
                          BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.email,
                              color: ColorRes.primaryColor,
                              size: 24,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5, left: 7, bottom: 5),
                              child: Text(
                                'Email',
                                style: AppTheme.inputLabelStyle,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 1, top: 16),
                        child: TextFormField(
                          controller: emailContoller,
                          validator: validateEmail,
                          autofocus: false,
                          onSaved: (String val) {
                            email = val;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white70),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white70),
                            ),
                            hintText: 'Enter your Email Id',
                            hintStyle: AppTheme.inputHintStyle,
                            contentPadding: EdgeInsets.only(top: 13, left: 38),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.only(top: 40),
                  child: Container(
                      height: 58,
                      width: Utils.getDeviceWidth(context),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: ColorRes.lightBlur,
                        child: Text(
                          'ตกลง',
                          style: AppTheme.btnTextStyle,
                        ),
                        onPressed: () {
                          _validateInputs();
                        },
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// Email Validation
  String validateEmail(String value) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter valid email';
    } else
      return null;
  }

// Validation are true or false
  bool _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      return true;
    } else {
      return false;
    }
  }
}
