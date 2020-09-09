import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/app_theme.dart';
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

  TextEditingController usernameController;
  TextEditingController emailController;
  TextEditingController conformPasswordController;
  TextEditingController passwordController;
  TextEditingController numberController;
  TextEditingController storeController;
  TextEditingController shopController;

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
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorRes.whiteColor,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: new Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: AppTheme.btnBackIcon,
                    onPressed: () {
                      navigatorPop(context);
                    },
                  ),
                  CommonView.logoImage(200, 0),
                  SizedBox(height: 50),
                  registerTitle(),
                  SizedBox(height: 7),
                  Container(
                    padding: EdgeInsets.only(top: 7),
                    child: Column(
                      children: <Widget>[
                        userNameTextFiled(),
                        SizedBox(height: 5),
                        emailTextFiled(),
                        SizedBox(height: 7),
                        passwordTextFiled(),
                        SizedBox(height: 7),
                        conPasswordTextFiled(),
                        SizedBox(height: 30),
                        Text(
                          'เลือกสถานะผู้ใช้งาน',
                          style: AppTheme.subHeaderStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            generalUser(),
                            SizedBox(width: 10),
                            dealer(),
                          ],
                        ),
                        //visible method are click button
                        Visibility(
                          visible: isDealerDetails,
                          child: Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              children: <Widget>[
                                dealerPhoneNumber(),
                                SizedBox(height: 7),
                                dealerStoreName(),
                                SizedBox(height: 7),
                                dealerShopAddress()
                              ],
                            ),
                          ),
                        ),
                        submitButton(),
                      ],
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
  //name validation
  String validateName(String value) {
    if (value.isEmpty)
      return 'Please enter your Name';
    else
      return null;
  }
  //email validation
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter valid emailid';
    } else
      return null;
  }
  //password validation
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
  //confirm password validation
  String validatePasswordMatching(String value) {
    var password = passKey.currentState.value;
    if (value.length == 0) {
      return "Password is Required";
    } else if (value != password) {
      return 'Password is not matching';
    }
    return null;
  }
  //mobile  number validation
  String validateMobile(String value) {
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  String validateStorename(String value) {
    if (value.isEmpty)
      return 'Please enter store name';
    else
      return null;
  }
  String validateShopaddress(String value){
    if (value.isEmpty)
      return 'Please enter shop address';
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
    return Text(
      StringRes.register,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: AppTheme.headerStyle,
    );
  }

  userNameTextFiled() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 6, bottom: 35),
          height: 68,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.person,
                color: ColorRes.primaryColor,
                size: 24,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left:7, bottom: 5),
                child: Text(
                  StringRes.userName,
                  style: AppTheme.inputLabelStyle,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 1, top: 16),
          child: TextFormField(
            controller: usernameController,
            validator: validateName,
            autofocus: false,
            onSaved: (String val) {
              username = val;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: 'Enter your Username',
              hintStyle: AppTheme.inputHintStyle,
              contentPadding: EdgeInsets.only(top: 13, left: 38),
            ),
          ),
        ),
      ],
    );
  }

  emailTextFiled() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 6, bottom: 35),
          height: 68,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.email,
                color: ColorRes.primaryColor,
                size: 24,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left:7, bottom: 5),
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
            controller: emailController,
            validator: validateEmail,
            autofocus: false,
            onSaved: (String val) {
              username = val;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: 'Enter your Emailid',
              hintStyle: AppTheme.inputHintStyle,
              contentPadding: EdgeInsets.only(top: 13, left: 38),
            ),
          ),
        ),
      ],
    );
  }

  passwordTextFiled() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 6, bottom: 35),
          height: 68,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.lock,
                color: ColorRes.primaryColor,
                size: 24,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left:7, bottom: 5),
                child: Text(
                  'Password',
                  style: AppTheme.inputLabelStyle,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 1, top: 16),
          child: TextFormField(
            key: passKey,
            obscureText: true,
            controller: passwordController,
            validator: validatePassword,
            autofocus: false,
            onSaved: (String val) {
              password = val;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: 'Enter your password',
              hintStyle: AppTheme.inputHintStyle,
              contentPadding: EdgeInsets.only(top: 13, left: 38),
            ),
          ),
        ),
      ],
    );
  }

  conPasswordTextFiled() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 6, bottom: 35),
          height: 68,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.lock,
                color: ColorRes.primaryColor,
                size: 24,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left:7, bottom: 5),
                child: Text(
                  'Confirm Password',
                  style: AppTheme.inputLabelStyle,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 1, top: 16),
          child: TextFormField(
            controller: conformPasswordController,
            obscureText: true,
            validator: validatePasswordMatching,
            autofocus: false,
            onSaved: (String val) {
              confirmPassword = val;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: 'Enter your password',
              hintStyle: AppTheme.inputHintStyle,
              contentPadding: EdgeInsets.only(top: 13, left: 38),
            ),
          ),
        ),
      ],
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
                  isDealerDetails = !isDealerDetails;
                }
              }
            }
          });
        },
        child: Container(
          height: 60,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
            color:isGeneralUser ? ColorRes.primaryColor : ColorRes.whiteColor,
            border: Border.all(color: ColorRes.primaryColor, width: 1)),
          child: AllText(
            'ผู้ใช้งานทั่วไป', 
            color: isGeneralUser ? ColorRes.whiteColor : ColorRes.blackColor,
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  //dealer button are use in validation are true then color are change in this button
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
                  isGeneralUser = !isGeneralUser;
                }
              }
            }
          });
        },
        child: Container(
          height: 60,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
              color:
                  isDealerDetails ? ColorRes.primaryColor : ColorRes.whiteColor,
              border: Border.all(color: ColorRes.primaryColor, width: 1)),
          child: AllText(
            'Dealer',
            color: isDealerDetails ? ColorRes.whiteColor : ColorRes.blackColor,
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  dealerPhoneNumber() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 6, bottom: 35),
          height: 68,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.confirmation_number,
                color: Colors.blue,
                size: 24,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left:7, bottom: 5),
                child: Text(
                  'หมายเลขผู้เสียภาษี',
                  style: AppTheme.inputLabelStyle,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 1, top: 16),
          child: TextFormField(
            controller: numberController,
            onSaved: (String val) {
              number = val;
            },
            validator: validateMobile,
            keyboardType: TextInputType.number,

            autofocus: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: '1234567899999',
              hintStyle: AppTheme.inputHintStyle,
              contentPadding: EdgeInsets.only(top: 13, left: 38),
            ),
          ),
        ),
      ],
    );
  }

  dealerStoreName() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 6, bottom: 35),
          height: 68,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.store,
                color: Colors.blue,
                size: 24,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left:7, bottom: 5),
                child: Text(
                  'ชื่อร้าน',
                  style: AppTheme.inputLabelStyle,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 1, top: 16),
          child: TextFormField(
            controller: storeController,
            onSaved: (String val) {
              store = val;
            },
            validator: validateStorename,
            maxLines: 1,
            autofocus: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: 'ชื่อร้าน',
              hintStyle: TextStyle(
                fontSize: 14,
              ),
              contentPadding: EdgeInsets.only(top: 13, left: 38),
            ),
          ),
        ),
      ],
    );
  }

  dealerShopAddress() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 6, bottom: 80),
          height: 118,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.blue,
                size: 24,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left:7, bottom: 5),
                child: Text(
                  'ที่อยู่ร้าน',
                  style: AppTheme.inputLabelStyle,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 1, top: 16),
          child: TextFormField(
            controller: shopController,
            onSaved: (String val) {
              shop = val;
            },
            validator: validateShopaddress,
            autofocus: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintText: 'ที่อยู่ร้าน',
              hintStyle: AppTheme.inputHintStyle,
              contentPadding: EdgeInsets.only(
                top: 13, left: 38
              ),
            ),
          ),
        ),
      ],
    );
  }

  // submit button are use the all validation are true then the button color change and the next filed are show
  submitButton() {
    return InkResponse(
      onTap: () {
        if(!_validateInputs())
          {

          }
        else{
          if (isGeneralUser || isDealerDetails) {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => SuccessScreen())
            );
          }
        }

      },
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 30),
        alignment: Alignment.center,
        width: Utils.getDeviceWidth(context),
        height: 58,
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
        child: Text(
          "ลงทะเบียน",
          textAlign: TextAlign.center,
          style: AppTheme.btnTextStyle,
        ),
      ),
    );
  }
}
