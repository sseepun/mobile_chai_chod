import 'package:ChaiChod/config/app_theme.dart';
import 'package:ChaiChod/export.dart';

class ManageProfileScreen extends StatefulWidget {
  @override
  _ManageProfileScreenState createState() => _ManageProfileScreenState();
}

class _ManageProfileScreenState extends State<ManageProfileScreen> {

  bool isUserLogin = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.bgColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorRes.lightWhite,
          body: Column(
            children: <Widget>[
              CommonView.backArrowAndTitle(
                context, 
                StringRes.accountTheYou, 
                ColorRes.blackColor
              ),
              SizedBox(height: 25),
              isUserLogin ? userLogo() : companyLogo(),
              SizedBox(height: isUserLogin ? 15 : 50),
              isUserLogin 
                ? Text(
                  "Mark Joley", 
                  style: AppTheme.subHeaderLargeStyle,  
                )
                : Text(
                  StringRes.youAreNotLogin,
                  style: AppTheme.headerSmallStyle,
                ),
              SizedBox(height: isUserLogin ? 7 : 40),
              isUserLogin ? userDetails() : loginButton()
            ],
          ),
        ),
      ),
    );
  }

  //show the image logo
  companyLogo() {
    return Container(
      height: Utils.getDeviceWidth(context) * 0.42,
      width: Utils.getDeviceWidth(context) * 0.42,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        color: Colors.black12,
        shape: BoxShape.circle,
      ),
      child: Image(
        image: AssetImage(Utils.getAssetsImg('logo'))
      ),
    );
  }

  // user logo is use the move to edit profile screen
  userLogo() {
    return Stack(
      children: <Widget>[
        Center(
          child: companyLogo(),
        ),
        Align(
          alignment: Alignment.topRight,
          child: InkResponse(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()),
              );
            },
            child: Container(
              height: 40,
              width: 40,
              margin: EdgeInsets.only(top: 15, right: 20),
              decoration: BoxDecoration(
                color: ColorRes.primaryColor,
                shape: BoxShape.circle
              ),
              child: Icon(Icons.edit, color: Colors.white,),
            ),
          ),
        )
      ],
    );
  }

  userDetails() {
    return Container(
      width: Utils.getDeviceWidth(context),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0.5, 0.5),
            color: Colors.black12,
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            StringRes.storeName,
            style: AppTheme.descGreyStyle,
          ),
          Text(
            'nutchatya.cha',
            style: AppTheme.descStyle,
          ),
          SizedBox(height: 15),
          Divider(height: 1, color: ColorRes.greyColor),
          SizedBox(height: 10),
          Text(
            StringRes.hTax,
            style: AppTheme.descGreyStyle,
          ),
          Text(
            '98765431215988',
            style: AppTheme.descStyle,
          ),
          SizedBox(height: 15),
          Divider(height: 1, color: ColorRes.greyColor),
          SizedBox(height: 10),
          Text(
            StringRes.currentAddress,
            style: AppTheme.descGreyStyle,
          ),
          Text(
            '999/9 นวมินทร์ บึงกลุ่ม กรุงเทพมหานคร',
            style: AppTheme.descStyle,
          ),
          Text(
            'รหัสไปรษณีย์ 10330',
            style: AppTheme.descStyle,
          ),
        ],
      ),
    );
  }

  loginButton() {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: InkResponse(
        onTap: () {
          logInScreenNavigator(context, 2);
        },
        child: FilledButton(
          text: StringRes.logIn,
          height: 58, 
          fontSize: 20
        )
      )
    );
  }

}
