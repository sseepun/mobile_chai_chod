import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/home_tab/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CompleteScreen extends StatefulWidget {
  final int i;

  const CompleteScreen({Key key, this.i}) : super(key: key);

  @override
  _CompleteScreenState createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorRes.whiteColor,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  rateCard(),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: AllText(StringRes.CompleteTitle,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: ColorRes.primaryColor),
                  ),
                  Container(
                    alignment: Alignment.center,

                    padding: EdgeInsets.only(left:100,top: 20),
                    child: AllText(StringRes.CompleteTitle1,
                        fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(height: 50),
                  Container(
                    child: Container(
                      width: Utils.getDeviceWidth(context) / 1.35,
                      height: 45,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: ColorRes.lightBlur,
                        child: Text('Back to homepage'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  //rate card design in method
  rateCard() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 35,left: 50),
            child:starRating(1.0),
          ),
          starRating1(1.0),
          Container(
            padding: EdgeInsets.only(top: 35),
            child:starRating2(1.0),
          ),
        ],
      ),
    );
  }

  starRating(item) {
    return Container(
      alignment: Alignment.centerLeft,
      child: SmoothStarRating(
        size: 70,
        rating: item,
        filledIconData: Icons.star,
        //halfFilledIconData: Icons.star_half,
        defaultIconData: Icons.star_border,
        color:Color(hexColor('#f3cb54')),
        //color: Colors.yellow,
        borderColor: Color(hexColor('#f3cb54')),
        starCount:1,
        allowHalfRating: true,
        spacing: 1.0,
//        onRated: (value) {
//          setState(() {
//            rating = value ;
//          });
//        },
      ),
    );
  }
  starRating1(item) {
    return Container(
      alignment: Alignment.centerLeft,
      child: SmoothStarRating(
        size: 130,
        rating: item,
        filledIconData: Icons.star,
        //halfFilledIconData: Icons.star_half,
        defaultIconData: Icons.star_border,
        color:Color(hexColor('#f3cb54')),
        //color: Colors.yellow,
        borderColor: Color(hexColor('#f3cb54')),
        starCount:1,
        allowHalfRating: true,
        spacing: 1.0,
//        onRated: (value) {
//          setState(() {
//            rating = value ;
//          });
//        },
      ),
    );
  }
  starRating2(item) {
    return Container(
      alignment: Alignment.centerLeft,
      child: SmoothStarRating(
        size: 70,
        rating: item,
        filledIconData: Icons.star,
        //halfFilledIconData: Icons.star_half,
        defaultIconData: Icons.star_border,
        color:Color(hexColor('#f3cb54')),
        //color: Colors.yellow,
        borderColor: Color(hexColor('#f3cb54')),
        starCount:1,
        allowHalfRating: true,
        spacing: 1.0,
//        onRated: (value) {
//          setState(() {
//            rating = value ;
//          });
//        },
      ),
    );
  }

}
