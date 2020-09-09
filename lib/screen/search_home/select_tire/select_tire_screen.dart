import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectTireScreen extends StatefulWidget {
  final int i;
  const SelectTireScreen({Key key, this.i}) : super(key: key);

  @override
  _SelectTireScreenState createState() => _SelectTireScreenState();
}

class _SelectTireScreenState extends State<SelectTireScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.lightWhite,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 280,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    //back arrow and title
                    CommonView.backArrowAndTitle(context,
                        StringRes.SelectTireTitle, ColorRes.blackColor),
                    appBar(),
                  ],
                ),
              ),
              //all methods are call
              productName(),
              productDes(),
              productName1(),
              productDes1(),
              productName2(),
              productDes2(),
              productName3(),
              productDes3(),
              productName4(),
              productDes4(),
              bottomButton(),
            ],
          ),
        ),
      ),
    );
  }

  appBar() {
    return Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(),
              child: Image.asset(
                Utils.getAssetsImg('tiers'),
                fit: BoxFit.fill,
                height: 210,
                width: 150,
              ),
            ),
            Container(
              padding: EdgeInsets.only(),
              child: Image.asset(
                Utils.getAssetsImg('singletire'),
                fit: BoxFit.fill,
                height: 170,
                width: 150,
              ),
            ),
          ],
        ));
  }

  // title name
  productName() {
  return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left:20,top: 5,bottom: 5),
            child: AllText(
              StringRes.SelectTireTitle1,
              color: ColorRes.blackColor,
              fontSize: 17,
            ),
          ),
        ],
      ));
}

//title description
  productDes() {
    return Container(
      height: 70,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(),
              child: AllText(
                StringRes.SelectTireDes1,
                color: ColorRes.blackColor,
                fontSize: 15,
              ),
            ),
            Container(
              padding: EdgeInsets.only(),
              child: AllText(
                StringRes.SelectTireDes1,
                color: ColorRes.blackColor,
                fontSize: 15,
              ),
            ),
          ],
        ));
  }

  productName1() {
    return Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left:20,top: 5,bottom: 5),
              child: AllText(
                StringRes.SelectTireTitle2,
                color: ColorRes.blackColor,
                fontSize: 17,
              ),
            ),
          ],
        ));
  }

  productDes1() {
    return Container(
        height: 50,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20,right: 100),
              child: AllText(
                StringRes.SelectTireDes2,
                color: ColorRes.blackColor,
                fontSize: 15,
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(),
              child: AllText(
                StringRes.SelectTireDes2,
                color: ColorRes.blackColor,
                fontSize: 15,
              ),
            ),
          ],
        ));
  }

  productName2() {
    return Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left:20,top: 5,bottom: 5),
              child: AllText(
                StringRes.SelectTireTitle3,
                color: ColorRes.blackColor,
                fontSize: 17,
              ),
            ),
          ],
        ));
  }

  productDes2() {
    return Container(
        height: 50,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20,right: 70),
              child: AllText(
                StringRes.SelectTireDes3,
                color: ColorRes.blackColor,
                fontSize: 15,
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(),
              child: AllText(
                StringRes.SelectTireDes3,
                color: ColorRes.blackColor,
                fontSize: 15,
              ),
            ),
          ],
        ));
  }

  productName3() {
    return Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left:20,top: 5,bottom: 5),
              child: AllText(
                StringRes.SelectTireTitle4,
                color: ColorRes.blackColor,
                fontSize: 17,
              ),
            ),
          ],
        ));
  }

  productDes3() {
    return Container(
        height: 110,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top:10,left: 20,right: 30),
                    child:Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child:  Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 20,
                          ),
                        ),
                        AllText(
                          StringRes.SelectTireDes4,
                          color: ColorRes.blackColor,
                          fontSize: 12,
                        ),
                      ],
                    )
                ),
                Container(
                    padding: EdgeInsets.only(top:10),
                    child:Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child:  Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 20,
                          ),
                        ),
                        AllText(
                          StringRes.SelectTireDes4,
                          color: ColorRes.blackColor,
                          fontSize: 12,
                        ),
                      ],
                    )
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top:10,left: 20,right: 60),
                    child:Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child:  Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 20,
                          ),
                        ),
                        AllText(
                          StringRes.SelectTireDes5,
                          color: ColorRes.blackColor,
                          fontSize: 12,
                        ),
                      ],
                    )
                ),
                Container(
                    padding: EdgeInsets.only(top:10),
                    child:Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child:  Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 20,
                          ),
                        ),
                        AllText(
                          StringRes.SelectTireDes5,
                          color: ColorRes.blackColor,
                          fontSize: 12,
                        ),
                      ],
                    )
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top:10,left: 20,right: 60),
                    child:Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child:  Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 20,
                          ),
                        ),
                        AllText(
                          StringRes.SelectTireDes6,
                          color: ColorRes.blackColor,
                          fontSize: 12,
                        ),
                      ],
                    )
                ),

              ],
            ),
          ],
        )
    );
  }

  productName4() {
    return Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left:20,top: 5,bottom: 5),
              child: AllText(
                StringRes.SelectTireTitle7,
                color: ColorRes.blackColor,
                fontSize: 17,
              ),
            ),
          ],
        ));
  }

  productDes4() {
    return Container(
        height: 160,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: AllText(
                    StringRes.SelectTireDes7,
                    color: ColorRes.blackColor,
                    fontSize: 15,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: AllText(
                    StringRes.SelectTireDes7,
                    color: ColorRes.blackColor,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: AllText(
                    StringRes.SelectTireDes7,
                    color: ColorRes.blackColor,
                    fontSize: 15,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(),
                  child: AllText(
                    StringRes.SelectTireDes7,
                    color: ColorRes.blackColor,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }

  bottomButton() {
    return Container(
      padding: EdgeInsets.only(top: 10),

    color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            width: 180,
            height: 60,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
              child: MaterialButton(
                minWidth: Utils.getDeviceWidth(context),
                height: 50,
                onPressed: () {
                  productScreenNavigator(context);
                },
                child: AllText(StringRes.SelectTireBtn1,color: Colors.white,),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(color: ColorRes.primaryColor)),
                color: ColorRes.primaryColor,
              ),
            ),
          ),
          Container(
            width: 180,
            height: 60,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
              child: MaterialButton(
                minWidth: Utils.getDeviceWidth(context),
                height: 50,
                onPressed: () {
                  productScreenNavigator(context);
                },
                child: AllText(StringRes.SelectTireBtn2,color: Colors.white,),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(color: ColorRes.primaryColor)),
                color: ColorRes.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }


}
