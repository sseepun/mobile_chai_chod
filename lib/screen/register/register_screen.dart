import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/success/success_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../login/login_screen.dart';

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
  var passKey = GlobalKey<FormFieldState>();

  TextEditingController usernameContoller;
  TextEditingController emailContoller;
  TextEditingController confirmpasswordContoller;
  TextEditingController passwordContoller;
  TextEditingController numberContoller;
  TextEditingController storeContoller;
  TextEditingController shopContoller;

  String username;
  String password;
  String email;
  String confirmPassword;
  String number;
  String store;
  String shop;

  bool isDealerDetails = false;
  bool isGeneralUser = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.whiteColor,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: new Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: CommonArrow.backArrow(),
                    ),
                    CommonView.logoImage(220, 80),
                    SizedBox(height: 25),
                    registerTitle(),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: <Widget>[
                          userNameTextFiled(),
                          emailTextFiled(),
                          passwordTextFiled(),
                          conPasswordTextFiled(),
                          SizedBox(height: 30),
                          AllText('Choose user status',
                              color: ColorRes.blackColor),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              generalUser(),
                              SizedBox(width: 10),
                              dealer(),
                            ],
                          ),
                          Visibility(
                            visible: isDealerDetails,
                            child: Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                children: <Widget>[
                                  dealerPhoneNumber(),
                                  dealerStoreName(),
                                  dealerShopAddress()
                                ],
                              ),
                            ),
                          ),
                          submitButton()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  String validateName(String value) {
    if (value.isEmpty)
      return 'Please enter Your Name';
    else
      return null;
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
  String validatePasswordMatching(String value) {
    var password = passKey.currentState.value;

    if (value.length == 0) {
      return "Password is Required";
    } else if (value != password) {
      return 'Password is not matching';
    }
    return null;
  }
  String validateMobile(String value) {
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
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

  registerTitle() {
    return AllText(
      StringRes.register,
      fontSize: 30.0,
      align: TextAlign.left,
      color: ColorRes.blackColor,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      letterSpace: 1,
    );
  }

  userNameTextFiled() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 60,
      decoration: new BoxDecoration(
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.all(Radius.circular(2)),
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
            validator: validateName,
            maxLines: 1,
            autofocus: false,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: 'Enter your Username',
              hintStyle: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 13,
              ),
              contentPadding: EdgeInsets.only(bottom: 20, left: 30),
            ),
          ),
        ],
      ),
    );
  }

  emailTextFiled() {
    return Container(
      padding: EdgeInsets.only(top: 7),
      child: Container(
        padding: EdgeInsets.only(left: 10),
        height: 60,
        decoration: new BoxDecoration(
          border: Border.all(color: Colors.black45),
          borderRadius: BorderRadius.all(Radius.circular(2)),
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
              controller: emailContoller,
              maxLines: 1,
              validator: validateEmail,
              autofocus: false,
              onSaved: (String val) {
                email = val;
              },
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                hintText: 'Enter your Password',
                hintStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 13,
                ),
                contentPadding: EdgeInsets.only(bottom: 20, left: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }

  passwordTextFiled() {
    return Container(
      padding: EdgeInsets.only(top: 7),
      child: Container(
        padding: EdgeInsets.only(left: 10),
        height: 60,
        decoration: new BoxDecoration(
          border: Border.all(color: Colors.black45),
          borderRadius: BorderRadius.all(Radius.circular(2)),
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
              key: passKey,
              onSaved: (String val) {
                password = val;
              },
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                hintText: 'Enter your Password',
                hintStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 13,
                ),
                contentPadding: EdgeInsets.only(bottom: 20, left: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }

  conPasswordTextFiled() {
    return Container(
      padding: EdgeInsets.only(top: 7),
      child: Container(
        padding: EdgeInsets.only(left: 10),
        height: 60,
        decoration: new BoxDecoration(
          border: Border.all(color: Colors.black45),
          borderRadius: BorderRadius.all(Radius.circular(2)),
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
              controller: confirmpasswordContoller,
              maxLines: 1,
              validator: validatePasswordMatching,
              autofocus: false,
              obscureText: true,
              onSaved: (String val) {
                confirmPassword = val;
              },
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                hintText: 'Enter your Password',
                hintStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 13,
                ),
                contentPadding: EdgeInsets.only(bottom: 20, left: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }

  generalUser() {
    return Expanded(
      flex: 1,
      child: InkResponse(
        onTap: () {
          setState(() {
            if(!_validateInputs()) {}
            else{
              {
                if (!isDealerDetails) {
                  isGeneralUser = !isGeneralUser;
                } else {
//              isGeneralUser = false;
                  isDealerDetails = !isDealerDetails;
                }
              }
            }
          });
        },
        child: Container(
          height: 50,
//          width: Utils.getDeviceWidth(context) / 2.2,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
              color:isGeneralUser ? ColorRes.primaryColor : ColorRes.whiteColor,
              border: Border.all(color: ColorRes.blackColor, width: 1)),
          child: AllText('General user', color: isGeneralUser ? ColorRes.whiteColor : ColorRes.blackColor),
        ),
      ),
    );
  }

  dealer() {
    return Expanded(
      flex: 1,
      child: InkResponse(
        onTap: () {
          setState(() {
            if(!_validateInputs()) {}
            else{
              {
                if (!isGeneralUser) {
                  isDealerDetails = !isDealerDetails;
                } else {
//              isDealerDetails = false;
                  isGeneralUser = !isGeneralUser;
                }
              }
            }
          });
        },
        child: Container(
          height: 50,
//          width: Utils.getDeviceWidth(context) / 2.5,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
              color:
                  isDealerDetails ? ColorRes.primaryColor : ColorRes.whiteColor,
              border: Border.all(color: ColorRes.blackColor, width: 1)),
          child: AllText('Dealer',
              color:
                  isDealerDetails ? ColorRes.whiteColor : ColorRes.blackColor),
        ),
      ),
    );
  }

  dealerPhoneNumber() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 60,
      decoration: new BoxDecoration(
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      child: ListView(
        padding: EdgeInsets.only(top: 5),
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.confirmation_number,
                color: Colors.blue,
                size: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'My taxpayer number',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          TextFormField(
            controller: numberContoller,
            onSaved: (String val) {
              number = val;
            },
            validator: validateMobile,
            maxLines: 1,
            keyboardType: TextInputType.number,

            autofocus: false,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: '1234567899999',
              hintStyle: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              contentPadding: EdgeInsets.only(bottom: 20, left: 30),
            ),
          ),
        ],
      ),
    );
  }

  dealerStoreName() {
    return Container(
      margin: EdgeInsets.only(top: 7),
      padding: EdgeInsets.only(left: 10),
      height: 60,
      decoration: new BoxDecoration(
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      child: ListView(
        padding: EdgeInsets.only(top: 5),
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.store,
                color: Colors.blue,
                size: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Store name',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          TextFormField(
            controller: storeContoller,
            onSaved: (String val) {
              store = val;
            },
            validator: validateName,
            maxLines: 1,
            autofocus: false,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: 'storname',
              hintStyle: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
              ),
              contentPadding: EdgeInsets.only(bottom: 20, left: 30),
            ),
          ),
        ],
      ),
    );
  }

  dealerShopAddress() {
    return Container(
      margin: EdgeInsets.only(top: 7),
      padding: EdgeInsets.only(left: 10),
      height: 110,
      decoration: new BoxDecoration(
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      child: ListView(
        padding: EdgeInsets.only(top: 5),
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.blue,
                size: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Shop address',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          TextFormField(
            controller: shopContoller,
            onSaved: (String val) {
              shop = val;
            },
            validator: validateName,
            autofocus: false,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: 'Shop address',
              hintStyle: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
              ),
              contentPadding: EdgeInsets.only(bottom: 20, left: 30),
            ),
          ),
        ],
      ),
    );
  }

  submitButton() {
    return InkResponse(
      onTap: () {
        if (isGeneralUser || isDealerDetails) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SuccessScreen()));
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 25, bottom: 10),
        alignment: Alignment.center,
        width: Utils.getDeviceWidth(context),
        height: 45,
        decoration: new BoxDecoration(
          color: isGeneralUser || isDealerDetails
              ? ColorRes.primaryColor
              : Color(hexColor('#E0E0E0')),
          borderRadius: BorderRadius.all(Radius.circular(2)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
            ),
          ],
        ),
        child: AllText(
          "Into",
          fontSize: 15,
          align: TextAlign.center,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
