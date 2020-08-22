import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/screen/tab4_user/set_up/setup_screen.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String oldPassword, newPassword, reNewPassowrd;
  TextEditingController emailController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController reNewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidate: true,
        key: _formKey,
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(height: 40),
              textTitle(),
              Container(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 4, bottom: 30),
                          height: 60,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.black45),
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, left: 10, bottom: 5),
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              'Email',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 1, top: 11),
                          child: TextFormField(
                            controller: emailController,
                            validator: validateEmail,
                            autofocus: false,
                            onSaved: (String val) {
                              email = val;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              hintText: 'Enter your email',
                              hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 13,
                              ),
                              contentPadding: EdgeInsets.only(top: 8, left: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 4, bottom: 30),
                          height: 60,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.black45),
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, left: 7, bottom: 5),
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              'Current Password',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 1, top: 11),
                          child: TextFormField(
                            obscureText: true,
                            validator: validatePassword,
                            controller: oldPasswordController,
                            autofocus: false,
                            onSaved: (String val) {
                              oldPassword = val;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              hintText: 'Enter old Password',
                              hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 13,
                              ),
                              contentPadding: EdgeInsets.only(top: 8, left: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 4, bottom: 30),
                          height: 60,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.black45),
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, left: 7, bottom: 5),
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              'Password',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 1, top: 11),
                          child: TextFormField(
                            validator: validatePassword,
                            controller: newController,
                            autofocus: false,
                            onSaved: (String val) {
                              newPassword = val;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              hintText: 'Enter new Password',
                              hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 13,
                              ),
                              contentPadding: EdgeInsets.only(top: 8, left: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 4, bottom: 30),
                          height: 60,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.black45),
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, left: 7, bottom: 5),
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              'Confirm Password',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 1, top: 11),
                          child: TextFormField(
                            validator: validatePassword,
                            controller: reNewController,
                            autofocus: false,
                            onSaved: (String val) {
                              reNewPassowrd = val;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              hintText: 'Enter Confirm Password',
                              hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 13,
                              ),
                              contentPadding: EdgeInsets.only(top: 8, left: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: ColorRes.primaryColor,
//        alignment: Alignment.bottomCenter,
        height: 50,
        margin: EdgeInsets.only(left: 5, right: 5),
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          onPressed: () {
            validateInput();
          },
          child: Text(
            'Save',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty)
      return 'Enter atleast 6 charater password';
    else
      return null;
  }

  validateInput() {
    if (_formKey.currentState.validate()) {
      print('success');
    }
  }

  textTitle() {
    return Container(
        child: Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10),
          child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SetUpScreen()),
                );
              },
              child: Icon(
                Icons.arrow_back,
                size: 25,
                color: Colors.black,
              )),
        ),
        Container(
          padding: EdgeInsets.only(left: 80),
          child: AllText(
            StringRes.passwordTitle,
            color: ColorRes.blackColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ));
  }
}
