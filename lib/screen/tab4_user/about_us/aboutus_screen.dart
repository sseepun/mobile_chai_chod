//import 'package:flutter/cupertino.dart';
import 'package:ChaiChod/export.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final controller = PageController();

  List<IconData> icons = [
    Icons.call,
    Icons.calendar_view_day,
    Icons.local_printshop
  ];

  List<String> stringList = [
    'Contact us',
    'About us',
    'Privacy policy',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
        bottom: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
            CommonView.backArrowAndTitle(context, StringRes.aboutUs, ColorRes.blackColor),
              SizedBox(height: 20),
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return listData(index);
                  }),
            ],
          ),
        ),
      ),
        ),  );
  }

//list data use in list of icon and strings and click the other screen
  listData(int index) {
    return InkResponse(
      onTap: () {
        if(index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactUsScreen()),
          );
        } else if(index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChildAboutUsScreen()),
          );
        } else if(index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>PrivacyPolicyScreen
              ()),
          );
        }
      },
      child:Container(
          height: 55,
          margin: EdgeInsets.only(left: 10, bottom: 10, right: 10),
          decoration: new BoxDecoration(
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
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 40,
                height: 40,
                decoration: new BoxDecoration(
                  color: ColorRes.lightBlur,
                  shape: BoxShape.circle,
                ),
                child:Icon(icons[index],
                    size: 20, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(right: 0, left: 10),
                child: AllText(
                  stringList[index],
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: ColorRes.blackColor,
                ),
              ),
            ],
          )),
    );
  }
}
