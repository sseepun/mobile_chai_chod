import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RateProductScreen extends StatefulWidget {
  final int i;

  const RateProductScreen({Key key, this.i}) : super(key: key);

  @override
  RateProductScreenState createState() => RateProductScreenState();
}

class RateProductScreenState extends State<RateProductScreen> {
  RateProductScreen model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = RateProductScreen();
  }
  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            leading: IconButton(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 5),
              icon: Icon(
                Icons.clear,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: Colors.white,
//            title: CommonView.appBarTitle(context, StringRes.shoppingCart),
          ),

          backgroundColor: ColorRes.whiteColor,
          body: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                // appBar(),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Column(
                    children: <Widget>[
                      rateCard(),
                      productDetailsView(),
                      Divider(height: 1, color: ColorRes.greyColor),
                      SizedBox(
                        height: 10,
                      ),
                      boxDetails(),
                      SizedBox(
                        height: 70,
                      ),
                      bottomButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Container(
        height: 100,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 50,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(top: 17, left: 10),
                  child: InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.clear,
                        size: 25,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
          ],
        ));
  }

  //rate card design
  rateCard() {
    return Container(
      child: Container(
          height: 120,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                  offset: Offset(0.5, 0.5),
                  color: ColorRes.greyColor,
                  blurRadius: 5.0)
            ],
            color: ColorRes.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child:  AllText(
                    StringRes.RateTitle,
                    color: ColorRes.blackColor,
                    fontSize: 13,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        children: <Widget>[
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[starRating(3.0)]),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
  starRating(item) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left:10.0,right:5.0),
      child: SmoothStarRating(
        size: 50,
        rating: item,
        filledIconData: Icons.star,
        //halfFilledIconData: Icons.star_half,
        defaultIconData: Icons.star_border,
        color:Color(hexColor('#f3cb54')),
        //color: Colors.yellow,
        borderColor: Color(hexColor('#f3cb54')),
        starCount: 5,
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

  productDetails(String leftTile, String rightSide) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 7, right: 7),
      child: Row(
        children: <Widget>[
          Expanded(
            child: AllText(
              leftTile,
              color: ColorRes.blackColor,
            ),
          ),
          Expanded(
            child: AllText(rightSide,
                align: TextAlign.end, color: ColorRes.blackColor),
          ),
        ],
      ),
    );
  }

  productDetailsView() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text('NANKA AS 2+ - 205/5RR/A'),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                width: Utils.getDeviceWidth(context) / 3.3,
                child:
                    Image.asset(Utils.getAssetsImg('tiers'), fit: BoxFit.fill),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    CommonView.productDetailsLeftRightData(
                        StringRes.brand, "Micheline"),
                    SizedBox(height: 2),
                    CommonView.productDetailsLeftRightData(
                        StringRes.pageWidth, "199mm"),
                    SizedBox(height: 2),
                    CommonView.productDetailsLeftRightData(
                        StringRes.seriesNumber, "Fifty Five"),
                    SizedBox(height: 2),
                    CommonView.productDetailsLeftRightData(
                        StringRes.edgeRubber, "Fifteen"),
                    SizedBox(height: 2),
                    CommonView.productDetailsLeftRightData(
                        StringRes.sidewall, "10.72 cm"),
                    SizedBox(height: 10),
                    Divider(
                      height: 1,
                      color: ColorRes.greyColor,
                    ),
                    productDetails(StringRes.count, "x2"),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  boxDetails() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 260),
                    child: AllText(
                      StringRes.RateDes1,
                      color: ColorRes.blackColor,
                      fontSize: 13,
                    ),
                  ),
                ],
              )),
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 4, bottom: 30),
                  height: 100,
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: AllText(
                    StringRes.RateDes2,
                    color: ColorRes.blackColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bottomButton() {
    return Container(
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
                onPressed: () {},
                child: AllText(StringRes.RateBtn1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(color: ColorRes.primaryColor)),
                color: ColorRes.whiteColor,
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
                  completeScreenNavigator(context);
                },
                child: AllText(StringRes.RateBtn2,color: Colors.white,),
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
