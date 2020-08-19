import 'package:ChaiChod/screen/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameContoller;
  TextEditingController passwordContoller;
  String username;
  String password;

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
                        padding: EdgeInsets.only(top: 60),
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/img/logo.png',
                          width: 220,
                          height: 80,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20, right: 230),
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              letterSpacing: 1,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: 340,
                              height: 60,
                              decoration: new BoxDecoration(
                                border: Border.all(color: Colors.black45),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                              ),
                              child: ListView(
                                padding: EdgeInsets.only(top: 5, bottom: 10),
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.person,
                                        color: Colors.blue,
                                        size: 20,
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 5, left: 10),
                                        child: Text(
                                          'Username',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 12,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  TextFormField(
                                    controller: usernameContoller,
                                    onSaved: (String val) {
                                      username = val;
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
                                      hintText: 'Enter your Username',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 13,
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(bottom: 20, left: 30),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 7),
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                width: 340,
                                height: 60,
                                decoration: new BoxDecoration(
                                  border: Border.all(color: Colors.black45),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                ),
                                child: ListView(
                                  padding: EdgeInsets.only(top: 5, bottom: 10),
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.lock,
                                          color: Colors.blue,
                                          size: 20,
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 10),
                                          child: Text(
                                            'Password',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 12,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    TextFormField(
                                      controller: passwordContoller,
                                      maxLines: 1,
                                      validator: validatePassword,
                                      autofocus: false,
                                      obscureText: true,
                                      onSaved: (String val) {
                                        password = val;
                                      },
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
                                        contentPadding: EdgeInsets.only(
                                            bottom: 20, left: 30),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            FlatButton(
                              padding: EdgeInsets.only(bottom: 15, left: 200),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordScreen()),
                                );
                              },
                              textColor: Color(hexColor('#4298D3')),
                              child: Text('Forgot your Password?'),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 30),
                              child: Container(
                                  width: 360,
                                  height: 45,
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: RaisedButton(
                                    textColor: Colors.white,
                                    color: Color(hexColor('#4298D3')),
                                    child: Text('Access'),
                                    onPressed: () {
                                      _validateInputs();
                                    },
                                  ),
                              ),
                            ),
                            Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: 50),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'If you do not have a account yet, ',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    FlatButton(
                                      padding: EdgeInsets.only(right: 1),
                                      textColor: Color(hexColor('#4298D3')),
                                      child: Text(
                                        'Please Register',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterScreen()),
                                        );
                                      },
                                    )
                                  ],
                                )),
                            Container(
                              padding: EdgeInsets.only(top: 7),
                              child: Column(children: <Widget>[
                                Row(children: <Widget>[
                                  Expanded(
                                    child: new Container(
                                        margin: const EdgeInsets.only(
                                            left: 70.0, right: 10.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 36,
                                        )),
                                  ),
                                  Text("OR"),
                                  Expanded(
                                    child: new Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0, right: 70.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 36,
                                        )),
                                  ),
                                ]),
                              ]),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 30),
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 60, top: 5, bottom: 5),
                                width: 270,
                                height: 45,
                                decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/img/facebook.png',
                                      width: 35,
                                      height: 30,
                                      fit: BoxFit.fill,
                                    ),
                                    Align(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Login with Facebook",
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Container(
                                padding: EdgeInsets.only(left: 55),
                                width: 270,
                                height: 45,
                                decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/img/google.png',
                                      width: 45,
                                      height: 35,
                                      fit: BoxFit.fill,
                                    ),
                                    Align(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          "Login with Google",
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
