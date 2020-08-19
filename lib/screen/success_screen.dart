import 'package:ChaiChod/screen/login_screen.dart';
import 'package:ChaiChod/screen/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'forgot_password_screen.dart';

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
                        padding: EdgeInsets.only(top: 200),
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/img/success.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          "Successfully registered!",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                              "Please wait for the review from  Admin",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 40),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 30),
                              child: Container(
                                width: 280,
                                height: 45,
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: RaisedButton(
                                  textColor: Colors.white,
                                  color: Color(hexColor('#4298D3')),
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

  String validatePassword(String value) {
    // ignore: non_constant_identifier_names
    Pattern UPPER = ("[A-Z]");
    // ignore: non_constant_identifier_names
    Pattern LOWER = ("[a-z]");
    // ignore: non_constant_identifier_names
    Pattern NUMBER = ("[0-9]");
    // ignore: non_constant_identifier_names
    Pattern Character = ("[!@#\$&*~]");

    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

    RegExp regex = new RegExp(pattern);
    RegExp regex1 = new RegExp(UPPER);
    RegExp regex2 = new RegExp(LOWER);
    RegExp regex3 = new RegExp(NUMBER);
    RegExp regex4 = new RegExp(Character);

    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex1.hasMatch(value)) return 'At least one upper case letter';
      if (!regex2.hasMatch(value)) return 'At least one lower case letter';
      if (!regex3.hasMatch(value)) return 'At least one digit';
      if (!regex4.hasMatch(value)) return 'At least one special character';
      if (!regex.hasMatch(value))
        return 'At least eight characters long';
      else
        return null;
    }
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
