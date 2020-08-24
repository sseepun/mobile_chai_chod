import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/filled_button.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/tab1_home/category/category_screen.dart';
import 'package:ChaiChod/screen/tab1_home/category/product/tab1_details/details_screen.dart';
import 'package:ChaiChod/screen/tab1_home/category/product/tab2_reviews/review_screen.dart';
import 'package:ChaiChod/screen/tab2_archive/tab1_shipping/shipping_screen.dart';
import 'package:ChaiChod/screen/tab2_archive/tab2_successfully/successful_delivery_screen.dart';
import 'package:ChaiChod/screen/tab4_user/manage_profile/edit_profile/edit_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'order_summary/order_summary_screen.dart';

class ProductScreen extends StatefulWidget {

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  final controller = PageController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  VoidCallback showPerBottomSheetCallBack;
  TabController tabController;
  List<String> listTitle = ['goodyear1', 'goodyear2', 'goodyear3', 'goodyear4'];
  int _n = 1;
  void add() {
    setState(() {
      _n++;
    });
  }
  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  @override
  void initState() {
    super.initState();
    showPerBottomSheetCallBack = _showModalSheet1;
    showPerBottomSheetCallBack = _showModalSheet2;
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.lightWhite,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                child: _appBar(),
              ),
              Container(
                  margin: EdgeInsets.only(top: 70),
                  child: Column(
                    children: <Widget>[
                      userLogo(),
                      listData(),
                      brandTable(),
                      relatedProducts(),
                      SizedBox(height: 20),
                      gridImage(),
                      SizedBox(height: 20),
                      button(),
                      SizedBox(height: 20),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _showModalSheet1() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            color: Colors.white,
            child: new Center(
                child: ListView(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding:
                                  EdgeInsets.only(top: 10, left: 5, right: 115),
                                  child: AllText(
                                    "NANKANG AS-2+ -205/55R16",
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.only(top: 10, left: 5, right: 281),
                                  child: AllText(
                                    "B2,500",
                                    color: ColorRes.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 5, left: 5, right: 282, bottom: 15),
                                  child: AllText(
                                    "Per line",
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Container(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topRight,
                                  padding: EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: <Widget>[
                                      AllText(
                                        StringRes.brandName,
                                        color: ColorRes.blackColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 185),
                                        child: Image.asset(
                                          Utils.getAssetsImg('michelin'),
                                          height: 25,
                                          width: 100,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(right: 230, top: 5),
                                child: FilledButton(
                                    height: 30,
                                    text: StringRes.buttonName,
                                    fontSize: 12,
                                    onPressed: () {}),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    height: 30,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Width',
                                          style: TextStyle(
                                            color: ColorRes.blackColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 240),
                                          child: Text(
                                            '195 mm.',
                                            style: TextStyle(
                                              color: ColorRes.blackColor,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    height: 30,
                                    color: ColorRes.lightWhite,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Rubber Series',
                                          style: TextStyle(
                                            color: ColorRes.blackColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 225),
                                          child: Text(
                                            '55',
                                            style: TextStyle(
                                              color: ColorRes.blackColor,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    height: 30,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Rubber edge',
                                          style: TextStyle(
                                            color: ColorRes.blackColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 232),
                                          child: Text(
                                            '15"',
                                            style: TextStyle(
                                              color: ColorRes.blackColor,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    height: 30,
                                    color: ColorRes.lightWhite,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Sidewall',
                                          style: TextStyle(
                                            color: ColorRes.blackColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 220),
                                          child: Text(
                                            '10.72 cm.',
                                            style: TextStyle(
                                              color: ColorRes.blackColor,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    Container(
                      child: new Center(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new FlatButton(
                              onPressed: minus,
                              child: new Icon(
                                  const IconData(0xe15b,
                                      fontFamily: 'MaterialIcons'),
                                  color: Colors.black),
                            ),
                            new Text('$_n', style: new TextStyle(fontSize: 20.0)),
                            new FlatButton(
                              onPressed: add,
                              child: new Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, bottom: 5),
                        child: FilledButton(
                            text: StringRes.btn1details,
                            fontSize: 18,
                            onPressed: () {
                              dialogBoxShow();
                            }),
                      ),
                    ),
                  ],
                )),
          );
        });
  }
  void dialogBoxShow() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              elevation: 0.0,
              backgroundColor:Colors.white,
              content: SingleChildScrollView(
                child:Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child:Image.asset(
                          Utils.getAssetsImg('dialogimg'),
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25,bottom: 30),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Added to cart',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              letterSpacing: 1.0,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        });
  }

  void _showModalSheet2() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            color: Colors.white,
            child: new Center(
                child: ListView(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding:
                                  EdgeInsets.only(top: 10, left: 5, right: 115),
                                  child: AllText(
                                    "NANKANG AS-2+ -205/55R16",
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.only(top: 10, left: 5, right: 281),
                                  child: AllText(
                                    "B2,500",
                                    color: ColorRes.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 5, left: 5, right: 282, bottom: 15),
                                  child: AllText(
                                    "Per line",
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Container(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topRight,
                                  padding: EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: <Widget>[
                                      AllText(
                                        StringRes.brandName,
                                        color: ColorRes.blackColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 185),
                                        child: Image.asset(
                                          Utils.getAssetsImg('michelin'),
                                          height: 25,
                                          width: 100,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(right: 230, top: 5),
                                child: FilledButton(
                                    height: 30,
                                    text: StringRes.buttonName,
                                    fontSize: 12,
                                    onPressed: () {}),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    height: 30,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Width',
                                          style: TextStyle(
                                            color: ColorRes.blackColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 240),
                                          child: Text(
                                            '195 mm.',
                                            style: TextStyle(
                                              color: ColorRes.blackColor,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    height: 30,
                                    color: ColorRes.lightWhite,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Rubber Series',
                                          style: TextStyle(
                                            color: ColorRes.blackColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 225),
                                          child: Text(
                                            '55',
                                            style: TextStyle(
                                              color: ColorRes.blackColor,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    height: 30,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Rubber edge',
                                          style: TextStyle(
                                            color: ColorRes.blackColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 232),
                                          child: Text(
                                            '15"',
                                            style: TextStyle(
                                              color: ColorRes.blackColor,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    height: 30,
                                    color: ColorRes.lightWhite,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Sidewall',
                                          style: TextStyle(
                                            color: ColorRes.blackColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 220),
                                          child: Text(
                                            '10.72 cm.',
                                            style: TextStyle(
                                              color: ColorRes.blackColor,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    Container(
                      child: new Center(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new FlatButton(
                              onPressed: minus,
                              child: new Icon(
                                  const IconData(0xe15b,
                                      fontFamily: 'MaterialIcons'),
                                  color: Colors.black),
                            ),
                            new Text('$_n', style: new TextStyle(fontSize: 20.0)),
                            new FlatButton(
                              onPressed: add,
                              child: new Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, bottom: 5),
                        child: FilledButton(
                            text: StringRes.btn2details,
                            fontSize: 18,
                            onPressed: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => OrderSummaryScreen()));                            }),
                      ),
                    ),
                  ],
                )),
          );
        });
  }

  Widget _appBar() {
    return Container(
        height: 410,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 50,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(top: 17),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryScreen()),
                        );
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.black,
                      )),
//        child: Image.asset(Utils.getAssetsImg('logo')),
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(left: 80, top: 10),
                  child: Row(
                    children: <Widget>[
                      AllText(
                        StringRes.ProductTitle,
                        color: ColorRes.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      IconButton(
                        onPressed: () {
                          print('Shopping Cart');
                          cartScreenNavigator(context);
                        },
                        padding: EdgeInsets.only(
                          bottom: 5,
                          left: 80,
                        ),
                        icon: Icon(Icons.shopping_basket),
                        iconSize: 28,
                        color: ColorRes.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  userLogo() {
    return Stack(
//      alignment: Alignment.topCenter
      children: <Widget>[
        Center(
          child: Image.asset(
            Utils.getAssetsImg('productimg'),
            height: 250,
            width: 250,
            fit: BoxFit.fill,
          ),
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
              child: Column(
                children: <Widget>[
                  Container(
                    height: 35,
                    width: 35,
                    margin: EdgeInsets.only(top: 10, right: 7),
                    decoration: BoxDecoration(boxShadow: [
                      new BoxShadow(
                        offset: Offset(0.5, 0.5),
                        color: ColorRes.greyColor,
                        blurRadius: 0.5,
                      ),
                    ], color: ColorRes.whiteColor, shape: BoxShape.circle),
                    child: Icon(
                      Icons.favorite,
                      size: 20,
                      color: ColorRes.primaryColor,
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    margin: EdgeInsets.only(top: 10, right: 7),
                    decoration: BoxDecoration(boxShadow: [
                      new BoxShadow(
                        offset: Offset(0.5, 0.5),
                        color: ColorRes.greyColor,
                        blurRadius: 0.5,
                      ),
                    ], color: ColorRes.whiteColor, shape: BoxShape.circle),
                    child: Icon(
                      Icons.share,
                      size: 20,
                      color: ColorRes.primaryColor,
                    ),
                  ),
                ],
              )),
        )
      ],
    );
  }

  listData() {
    return Container(
        margin: EdgeInsets.only(left: 10, top: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 5, right: 115),
                  child: AllText(
                    "NANKANG AS-2+ -205/55R16",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 5, right: 281),
                  child: AllText(
                    "B2,500",
                    color: ColorRes.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(top: 5, left: 5, right: 282, bottom: 15),
                  child: AllText(
                    "Per line",
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  brandTable() {
    return Container(
        height: 940,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(left: 20, top: 5),
                  child: Row(
                    children: <Widget>[
                      AllText(
                        StringRes.brandName,
                        color: ColorRes.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 185),
                        child: Image.asset(
                          Utils.getAssetsImg('michelin'),
                          height: 25,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(right: 230, top: 5),
                child: FilledButton(
                    height: 30,
                    text: StringRes.buttonName,
                    fontSize: 12,
                    onPressed: () {}),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 30,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Width',
                          style: TextStyle(
                            color: ColorRes.blackColor,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 240),
                          child: Text(
                            '195 mm.',
                            style: TextStyle(
                              color: ColorRes.blackColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 30,
                    color: ColorRes.lightWhite,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Rubber Series',
                          style: TextStyle(
                            color: ColorRes.blackColor,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 225),
                          child: Text(
                            '55',
                            style: TextStyle(
                              color: ColorRes.blackColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 30,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Rubber edge',
                          style: TextStyle(
                            color: ColorRes.blackColor,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 232),
                          child: Text(
                            '15"',
                            style: TextStyle(
                              color: ColorRes.blackColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 30,
                    color: ColorRes.lightWhite,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Sidewall',
                          style: TextStyle(
                            color: ColorRes.blackColor,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 220),
                          child: Text(
                            '10.72 cm.',
                            style: TextStyle(
                              color: ColorRes.blackColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AllText(
                    StringRes.ProductTitle1,
                    color: ColorRes.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: TabBar(
                indicatorColor: ColorRes.primaryColor,
                labelColor: ColorRes.primaryColor,
                isScrollable: false,
                labelStyle: TextStyle(color: ColorRes.primaryColor),
                tabs: <Tab>[
                  Tab(
                      child: AllText(StringRes.tab1,
                          fontSize: 17, color: ColorRes.primaryColor)),
                  Tab(
                      child: AllText(StringRes.tab2,
                          fontSize: 17, color: ColorRes.primaryColor)),
                ],
                controller: tabController,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  DetailsScreen(),
                  ReviewScreen(),
                ],
                controller: tabController,
              ),
            ),
          ],
        ));
  }

  relatedProducts() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                StringRes.ProductTitle3,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  gridImage() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listTitle.length,
      padding: EdgeInsets.only(left: 10, right: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: Utils.getDeviceWidth(context) /
              (Utils.getDeviceHeight(context) / 1.25)),
      itemBuilder: (context, index) {
        return Container(
          height: 150,
          padding: EdgeInsets.only(left: 8, right: 8),
          color: ColorRes.whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image(image: AssetImage(Utils.getAssetsImg('tiers'))),
              Column(
//                  mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AllText(
                    "GOODYEAR",
                    color: ColorRes.blackColor,
                  ),
                  AllText(
                    "Tires 225/45/R17",
                    color: ColorRes.blackColor,
                  ),
                  AllText(
                    "\$2,000 /len.",
                    color: ColorRes.blackColor,
                  )
                ],
              )
            ],
          ),
          /*  child:Container(

            color: Colors.white,
              margin: EdgeInsets.only(bottom: 10),
                child:Column(
                  children: <Widget>[
                    Image.asset(
                     Utils.getAssetsImg(listTitle[index]),
                      width: 300,
                      height: 170,
                     ),
                  ],
                ),
          ),*/
        );
      },
    );
  }

  button() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: <Widget>[
          Container(
              height: 40,
              width: 160,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorRes.primaryColor,
                  )),
              child: FlatButton(
                color: ColorRes.whiteColor,
                child: AllText(
                  StringRes.btn1,
                  fontSize: 15,
                  color: ColorRes.primaryColor,
                ),
                onPressed: () {
                  onPressed:
                  _showModalSheet1();
                },
              )),
          Container(
              height: 40,
              width: 180,
              padding: EdgeInsets.only(left: 10),
              child: FlatButton(
                color: ColorRes.primaryColor,
                child: AllText(
                  StringRes.btn2,
                  fontSize: 15,
                  color: ColorRes.whiteColor,
                ),
                onPressed: () {
                  _showModalSheet2();
                },
              )),
        ],
      ),
    );
  }
}
