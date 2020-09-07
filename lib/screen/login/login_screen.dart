import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/register/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../home_tab/main_screen.dart';

class LoginScreen extends StatefulWidget {
  final int i;
  const LoginScreen({Key key, this.i}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  // hex color code
  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Text Controller
  TextEditingController usernameController = TextEditingController(text: 'Testting@gmail.com');
  TextEditingController passwordController = TextEditingController(text: "TEst@1234565");
  String username;
  String password;

  @override
  void initState() {
    super.initState();
  }

//  LoginViewModel model;

  @override
  Widget build(BuildContext context) {
//    model ?? (model = LoginViewModel(this));

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
                    SizedBox(height: 20),
                    // heading Image logo
                    CommonView.logoImage(220, 80),
                    SizedBox(height: 40),
                    // heading title
                    AllText(
                      StringRes.signIn,
                      fontSize: 30.0,
                      align: TextAlign.left,
                      color: ColorRes.blackColor,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      letterSpace: 1,
                    ),
                    SizedBox(height: 10),
                    //All method call in this column
                    Column(
                      children: <Widget>[
                        userNameTextFiled(),
                        SizedBox(height: 5),
                        passWordTextFiled(),
                        SizedBox(height: 10),
                        forgotPassword(),
                        accessButton(),
                        registerTitle(),
                        SizedBox(height: 7),
                        orTitle(),
                        faceBookButton(),
                        googleButton(),
                        appleButton(),
                        SizedBox(height: 7),
                      ],
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

  // Email Validation
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter valid email';
    } else
      return null;
  }

  // Password Validation
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

  // Validation true or false
  bool _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      return true;
    } else {
      return false;
    }
  }

  // User name text filed
  userNameTextFiled() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 4, bottom: 30),
          height: 60,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.person,
                color: ColorRes.primaryColor,
                size: 20,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 7, bottom: 5),
                child: AllText(
                  StringRes.userName,
                  fontSize: 12,
                  color: ColorRes.blackColor,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 1, top: 11),
          child: TextFormField(
            controller: usernameController,
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
              hintText: 'Enter your Password',
              hintStyle: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 13,
              ),
              contentPadding: EdgeInsets.only(top: 8, left: 30),
            ),
          ),
        ),
      ],
    );
  }

  //Password text filed
  passWordTextFiled() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 4, bottom: 30),
          height: 60,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.lock,
                color: ColorRes.primaryColor,
                size: 20,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 7, bottom: 5),
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
        ),
        Padding(
          padding: EdgeInsets.only(left: 1, top: 11),
          child: TextFormField(
            controller: passwordController,
            validator: validatePassword,
            autofocus: false,
            obscureText: true,
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
              hintText: 'Enter your Password',
              hintStyle: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 13,
              ),
              contentPadding: EdgeInsets.only(top: 8, left: 30),
            ),
          ),
        ),
      ],
    );
  }

  //forgotPassword text filed
  forgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
          );
        },
        child:
            AllText(StringRes.forgotPasswordTitle, color: ColorRes.lightBlur),
      ),
    );
  }

  //Access Button are use in move to main screen
  accessButton() {
    return Container(
      height: 45,
      width: Utils.getDeviceWidth(context),
      margin: EdgeInsets.only(top: 40),
      child: RaisedButton(
        textColor: ColorRes.whiteColor,
        color: ColorRes.lightBlur,
        child: Text('Access'),
        onPressed: () {
          if (_validateInputs()) {
            if(widget.i == 2 ) {
              navigatorPop(context);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            }
          }
        },
      ),
    );
  }

  //register text filed and its use to move the registration screen
  registerTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AllText(
          StringRes.youHaveAccount,
          fontSize: 12,
          color: ColorRes.blackColor,
        ),
        FlatButton(
          padding: EdgeInsets.only(right: 1),
          textColor: ColorRes.lightBlur,
          child: AllText(StringRes.pleaseRegister, fontSize: 12),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterScreen()),
            );
          },
        )
      ],
    );
  }

  //orTitle Divider
  orTitle() {
    return Column(children: <Widget>[
      Row(children: <Widget>[
        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 70.0, right: 10.0),
              child: Divider(
                color: ColorRes.blackColor,
                height: 36,
              )),
        ),
        AllText("OR", color: ColorRes.greyColor),
        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 10.0, right: 70.0),
              child: Divider(
                color: ColorRes.blackColor,
                height: 36,
              )),
        ),
      ]),
    ]);
  }

  //faceBookButton
  faceBookButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 270,
      height: 45,
      decoration: new BoxDecoration(
        color: ColorRes.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(2)),
        boxShadow: [
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            Utils.getAssetsImg('facebook'),
            width: 35,
            height: 30,
            fit: BoxFit.fill,
          ),
          Align(
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              child: AllText(
                StringRes.faceBookLoginTitle,
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //googleButton
  googleButton() {
    return Container(
      margin: EdgeInsets.only(top: 13, bottom: 10),
      width: 270,
      height: 45,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(2)),
        boxShadow: [
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            Utils.getAssetsImg('google'),
            width: 45,
            height: 35,
            fit: BoxFit.fill,
          ),
          Align(
            child: Container(
              padding: const EdgeInsets.only(left: 15),
              child: AllText(
                StringRes.googleLoginTitle,
                fontSize: 13,
                color: ColorRes.blackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 10)
        ],
      ),
    );
  }

  //appleButton
  appleButton() {
    return Container(
      width: 270,
      height: 45,
      decoration: new BoxDecoration(
        color: ColorRes.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(2)),
        boxShadow: [
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.only(right: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              Utils.getAssetsImg('apple'),
              width: 38,
              height: 35,
              fit: BoxFit.fill,
            ),
            Align(
              child: Container(
                padding: const EdgeInsets.only(left: 7),
                child: AllText(
                  StringRes.appleLoginTitle,
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
