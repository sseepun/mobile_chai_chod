import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ChaiChod/config/util.dart';

import '../login/login_screen.dart';
class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgorPasswordScreenState createState() => _ForgorPasswordScreenState();
}

class _ForgorPasswordScreenState extends State<ForgotPasswordScreen> {
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
    return Scaffold(
      backgroundColor: Color(hexColor('#FFFFFF')),
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
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 30, left: 0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              letterSpacing: 1,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 25),
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "Enter Your Email",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              letterSpacing: 1,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 17),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              height: 60,
                              margin: EdgeInsets.only(left: 10, right: 10),
                              decoration: new BoxDecoration(
                                border: Border.all(color: Colors.black45),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                              ),
                              child: ListView(
                                padding: EdgeInsets.only(top: 8, bottom: 10),
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.email,
                                        color: Color(hexColor('#4298D3')),
                                        size: 20,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Email',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 12,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  TextFormField(
                                    controller: emailContoller,
                                    onSaved: (String val) {
                                      email = val;
                                    },
                                    validator: validateEmail,
                                    keyboardType: TextInputType.emailAddress,
                                    maxLines: 1,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white70),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white70),
                                      ),
                                      hintText: 'Enter your Password',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 13,
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(bottom: 30, left: 30),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 40),
                              margin: EdgeInsets.only(left: 10, right: 10),

                              child: Container(
                                  height: 45,
                                  width: Utils.getDeviceWidth(context),
                                  child: RaisedButton(
                                    textColor: Colors.white,
                                    color: Color(hexColor('#4298D3')),
                                    child: Text('OK'),
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
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter valid email';
    } else
      return null;
  }

  bool _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      return true;
    } else {
      return false;
    }
  }
}
