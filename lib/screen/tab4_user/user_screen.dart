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
    return Container(
        color: Colors.white,
        child: SafeArea(
        bottom: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            CommonView.titleText(StringRes.userHeading),
            SizedBox(height: 20),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return listData(index);
                }),
          ],
        ),
      ),
        ), );
  }


  //list data are use in list of icons and list og strings design
  listData(int index) {
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
          height: 55,
          margin: EdgeInsets.only(left: 10, bottom: 10, right: 10),
          decoration:  BoxDecoration(
            boxShadow: [
              new BoxShadow(
                offset: Offset(0.5, 0.5),
                color: ColorRes.greyColor,
                blurRadius: 0.5,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 40,
                      height: 40,
                      decoration: new BoxDecoration(
                        color: ColorRes.lightBlur,
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                      ),
                      child:Icon(icons[index],
                          size: 20, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 0, left: 10),
                    child: AllText(
                      stringList[index],
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: ColorRes.blackColor
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
