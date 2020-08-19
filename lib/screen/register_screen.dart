import 'package:ChaiChod/screen/register_general_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'forgot_password_screen.dart';
import 'login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                        padding: EdgeInsets.only(right: 350, top: 10),
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
                          "Register",
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
                                        padding: EdgeInsets.only(left: 10),
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
                                          Icons.email,
                                          color: Colors.blue,
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
                                          padding: EdgeInsets.only(left: 10),
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
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Confirm Password',
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
                              padding: EdgeInsets.only(top: 20),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordScreen()),
                                );
                              },
                              textColor: Colors.black,
                              child: Text('Choose user status'),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 180,
                                    height: 75,
                                    padding: EdgeInsets.only(
                                        left: 10, top: 30, right: 15),
                                    child: OutlineButton(
                                      child: Text('General user'),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterGeneralScreen()),
                                        );
                                      },
                                      //callback when button is clicked
                                      borderSide: BorderSide(
                                        color: Color(hexColor('#4298D3')),
                                        style: BorderStyle.solid,
                                        //Style of the border
                                        width: 0.8, //width of the border
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 170,
                                    height: 75,
                                    padding: EdgeInsets.only(top: 30),
                                    child: OutlineButton(
                                      child: Text('Dealer'),
                                      onPressed: () {},
                                      //callback when button is clicked
                                      borderSide: BorderSide(
                                        color: Color(hexColor('#4298D3')),
                                        style: BorderStyle.solid,
                                        //Style of the border
                                        width: 0.8, //width of the border
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 40),
                              child: Container(
                                width: 340,
                                height: 45,
                                decoration: new BoxDecoration(
                                  color: Color(hexColor('#E0E0E0')),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    child: Text(
                                      "Into",
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
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
