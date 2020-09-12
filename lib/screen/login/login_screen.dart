import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/app_theme.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/register/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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

  // LoginViewModel model;

  @override
  Widget build(BuildContext context) {
    // model ?? (model = LoginViewModel(this));

    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
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
                      SizedBox(height: 30),
                      // heading Image logo
                      CommonView.logoImage(200, 0),
                      SizedBox(height: 50),
                      // heading title
                      Text(
                        StringRes.signIn,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.headerStyle,
                      ),
                      SizedBox(height: 10),
                      //All method call in this column
                      Column(
                        children: <Widget>[
                          SizedBox(height: 7),
                          userNameTextFiled(),
                          SizedBox(height: 5),
                          passWordTextFiled(),
                          SizedBox(height: 10),
                          forgotPassword(),
                          accessButton(),
                          SizedBox(height: 5),
                          registerTitle(),
                          SizedBox(height: 10),
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
          padding: EdgeInsets.only(left: 6, bottom: 35),
          height: 68,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                MdiIcons.bagPersonalOutline,
                color: ColorRes.primaryColor,
                size: 24,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 7, bottom: 5),
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
              hintStyle: AppTheme.inputHintStyle,
              contentPadding: EdgeInsets.only(top: 13, left: 38),
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
          padding: EdgeInsets.only(left: 6, bottom: 35),
          height: 68,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                MdiIcons.lockOutline,
                color: ColorRes.primaryColor,
                size: 24,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 7, bottom: 5),
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
              hintStyle: AppTheme.inputHintStyle,
              contentPadding: EdgeInsets.only(top: 13, left: 38),
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
            AllText(
              StringRes.forgotPasswordTitle, 
              color: ColorRes.lightBlur,
              fontSize: 16,
            ),
      ),
    );
  }

  //Access Button are use in move to main screen
  accessButton() {
    return Container(
      height: 58,
      width: Utils.getDeviceWidth(context),
      margin: EdgeInsets.only(top: 40),
      child: RaisedButton(
        textColor: ColorRes.whiteColor,
        color: ColorRes.lightBlur,
        child: Text(
          'เข้าใช้งาน',
          style: AppTheme.btnTextStyle,
        ),
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
          fontSize: 16,
          color: ColorRes.blackColor,
          fontWeight: FontWeight.w500,
        ),
        FlatButton(
          padding: EdgeInsets.only(left: 0, right: 0),
          textColor: ColorRes.lightBlur,
          child: AllText(
            StringRes.pleaseRegister, 
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
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
        AllText(
          "หรือ", 
          color: ColorRes.greyColor,
          fontSize: 14,
        ),
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
      width: 300,
      height: 50,
      decoration: new BoxDecoration(
        color: ColorRes.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(2)),
        boxShadow: [
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
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
                fontSize: 18,
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
      width: 300,
      height: 50,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(2)),
        boxShadow: [
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
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
                fontSize: 18,
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
      width: 300,
      height: 50,
      decoration: new BoxDecoration(
        color: ColorRes.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(2)),
        boxShadow: [
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
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
                  fontSize: 18,
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
