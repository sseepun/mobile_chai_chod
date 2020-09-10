import 'package:ChaiChod/config/app_theme.dart';
import 'package:ChaiChod/export.dart';
import 'package:flutter/cupertino.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final controller = PageController();

  //list of icons
  List<IconData> icons = [
    Icons.person_outline,
    Icons.favorite_border,
    Icons.history,
    Icons.settings,
    Icons.view_day
  ];

  //list of strings
  List<String> stringList = [
    StringRes.manageProfile,
    StringRes.favorites,
    StringRes.orderHistory,
    StringRes.setUp,
    StringRes.aboutUs
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.bgColor,
        body: Column(
          children: <Widget>[
            CommonView.titleText(StringRes.userHeading),
            SizedBox(height: 20),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return userTabs(index);
              }
            ),
          ],
        ),
      ),
    );
  }

  userTabs(int index) {
    return InkResponse(
      onTap: () {
        if(index == 0) {
          manageProfileScreenNavigator(context);
        } else if(index == 1) {
          favoriteScreenNavigator(context);
        } else if(index == 2) {
          notificationScreenNavigator(context, 2);
        } else if(index == 3) {
          setUpScreenNavigator(context);
        } else if(index == 4) {
          aboutScreenNavigator(context);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 15, right: 15),
        padding: EdgeInsets.fromLTRB(15, 13, 15, 13),
        decoration:  BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0.5, 0.5),
              color: Colors.black12,
              blurRadius: 2,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(),
              child: Container(
                margin: EdgeInsets.only(right: 15),
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: ColorRes.lightBlur,
                  borderRadius: BorderRadius.all(
                    Radius.circular(200)
                  ),
                ),
                child:Icon(
                  icons[index],
                  size: 24, color: Colors.white
                ),
              ),
            ),
            Text(
              stringList[index],
              style: AppTheme.descBlackStyle,
            ),
          ],
        ),
      ),
    );
  }
}
