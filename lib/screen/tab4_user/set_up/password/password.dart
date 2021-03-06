import 'package:ChaiChod/export.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String oldPassword, newPassword, reNewPassword;
  TextEditingController emailController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController reNewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
        bottom: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70), // here the desired height
          child: AppBar(
            elevation: 0.0,
            leading: IconButton(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only( left: 5),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(StringRes.passwordTitle,
                  style: TextStyle(color: ColorRes.blackColor)),
            ),
            backgroundColor: ColorRes.whiteColor,
//            title: CommonView.appBarTitle(context, StringRes.shoppingCart),
            centerTitle: true,
          ),
        ),

        body: Form(
          autovalidate: true,
          key: _formKey,
          child: SizedBox(
            child: Column(
              children: [

                // CommonView.backArrowAndTitle(context, StringRes.passwordTitle, ColorRes.blackColor),

                Container(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      emailTextFiled(),
                      SizedBox(
                        height: 10,
                      ),
                      currentPasswordTextFiled(),
                      SizedBox(
                        height: 10,
                      ),
                      newPassWordTextFiled(),
                      SizedBox(
                        height: 10,
                      ),
                       conformPasswordTextFiled() ,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
       bottomNavigationBar:  Container(
         child: Padding(
           padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
           child: FilledButton(text: StringRes.save, fontSize: 18,  onPressed: () {
             if (_validateInputs()) {

             }
             }),
         ),
       ),
      ),
        ), );
  }

  bool _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      return true;
    } else {
      return true;
    }
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

  emailTextFiled() {
    return Stack(
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
                fontSize: 13,
              ),
              contentPadding: EdgeInsets.only(top: 8, left: 18),
            ),
          ),
        ),
      ],
    );
  }

  currentPasswordTextFiled() {
    return Stack(
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
                fontSize: 13,
              ),
              contentPadding: EdgeInsets.only(top: 8, left: 15),
            ),
          ),
        ),
      ],
    );
  }

  newPassWordTextFiled() {
    return Stack(
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
                fontSize: 13,
              ),
              contentPadding: EdgeInsets.only(top: 8, left: 16),
            ),
          ),
        ),
      ],
    );
  }

  conformPasswordTextFiled() {
    return Stack(
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
              reNewPassword = val;
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
                fontSize: 13,
              ),
              contentPadding: EdgeInsets.only(top: 8, left: 16),
            ),
          ),
        ),
      ],
    );
  }
}
