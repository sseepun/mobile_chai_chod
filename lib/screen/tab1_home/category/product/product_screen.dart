import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/filled_button.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/config/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'order_summary/order_summary_screen.dart';

class ProductScreen extends StatefulWidget {
  final int i;

  const ProductScreen({Key key, this.i}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  final controller = PageController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  VoidCallback showPerBottomSheetCallBack;
  TabController tabController;
  double rating = 3.0;
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
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: AppTheme.btnBackIcon,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: Colors.white,
            title: Text(
              'รายละเอียดสินต้า',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTheme.subHeaderSmallStyle,
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_basket),
                color: ColorRes.primaryColor,
                onPressed: () {
                  cartScreenNavigator(context);
                },
              ),
            ],
          ),
          backgroundColor: ColorRes.whiteColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                userOptions(),
                productDisplay(),
                SizedBox(height: 10),
                Divider(height: 1, color: ColorRes.greyColor),
                productDetails(),
                SizedBox(height: 20),
                productDetailTabs(),
                listProductData(),
                SizedBox(height: 20),
                twoButton(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //user options show in this method
  userOptions() {
    return Stack(
      // alignment: Alignment.topCenter
      children: <Widget>[
        Center(
          child: Image.asset(
            Utils.getAssetsImg('productimg'),
            height: Utils.getDeviceWidth(context) * 0.75,
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Column(
            children: <Widget>[
              iconShow(Icons.favorite, 1),
              iconShow(Icons.share, 2),
            ],
          ),
        )
      ],
    );
  }

  productDisplay() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "NANKANG AS-2+ -205/55R16",
            style: AppTheme.productNameLargeStyle,
          ),
          SizedBox(height: 7),
          Text(
            "\$2,500",
            style: AppTheme.productPriceLargeStyle,
          ),
          Text(
            "ต่อเส้น",
            style: AppTheme.productUnitLargeStyle,
          ),
        ],
      )
    );
  }

  productDetails() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      StringRes.brandName,
                      style: AppTheme.descSemiboldStyle,
                    ),
                    Image.asset(
                      Utils.getAssetsImg('michelin'),
                      width: 150,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              Container(
                padding: EdgeInsets.fromLTRB(15, 5, 45, 5),
                color: Colors.blue,
                child: Text(
                  StringRes.buttonName,
                  style: AppTheme.btnTextStyle,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        CommonView.productDetailRow(StringRes.width, "195 mm.", false),
        CommonView.productDetailRow(StringRes.rubberSeries, "55", true),
        CommonView.productDetailRow(StringRes.rubberEdge, '15"', false),
        CommonView.productDetailRow(StringRes.sidewallTxt, "10.72 cm.", true),
      ],
    );
  }

  //tab bar heading
  productDetailTabs() {
    return Container(
      height: 800,
      child: Column(
        children: <Widget>[
          CommonView.titleText(StringRes.ProductTitle1),
          SizedBox(height: 5),
          TabBar(
            indicatorColor: ColorRes.primaryColor,
            labelColor: ColorRes.primaryColor,
            isScrollable: false,
            labelStyle: TextStyle(color: ColorRes.primaryColor),
            tabs: <Tab>[
              Tab(
                child: AllText(
                  StringRes.tab1,
                  fontSize: 17, 
                  color: ColorRes.primaryColor
                )
              ),
              Tab(
                child: AllText(
                  StringRes.tab2,
                  fontSize: 17, 
                  color: ColorRes.primaryColor
                )
              ),
            ],
            controller: tabController,
          ),
          Expanded(
            child: TabBarView(
              children: [
                listData(),
                ReviewsTab(),
              ],
              controller: tabController,
            ),
          ),
        ],
      ),
    );
  }

  relatedProducts() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 15),
      child: AllText(
        StringRes.ProductTitle3,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 16,
      ),
    );
  }

  //
  listProductData() {
    return Container(
      // height: 275,
      padding: EdgeInsets.only(bottom: 15),
      alignment: Alignment.topLeft,
      color: ColorRes.lightWhite,
      width: Utils.getDeviceWidth(context),
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          relatedProducts(),
          SizedBox(height: 20),
          Container(
            // height: 200,
            height: MediaQuery.of(context).size.height * 0.35,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
//        physics: NeverScrollableScrollPhysics(),
              itemCount: listTitle.length,
              padding: EdgeInsets.only(left: 10, right: 10),
              /*  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: Utils.getDeviceWidth(context) /
                      (Utils.getDeviceHeight(context) / 1.25)),*/
              itemBuilder: (context, index) {
                return Container(
                  // height: 175,
//                  width: 125,
//            width: 100,
                  padding: EdgeInsets.only(left: 8, right: 8),
                  margin: EdgeInsets.only(left: 10, right: 10),

                  color: ColorRes.whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image(
                          height: 130,
                          image: AssetImage(Utils.getAssetsImg('tiers')),
                          fit: BoxFit.fill),
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
                          SizedBox(
                            height: 6,
                          ),
                          AllText(
                            "\$2,000 /len.",
                            color: ColorRes.blackColor,
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  twoButton() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
                height: 50,
//              width: 160,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: ColorRes.primaryColor,
                )),
                child: FlatButton(
                  color: ColorRes.whiteColor,
                  child: AllText(
                    StringRes.btn1,
                    fontSize: 15,
                    align: TextAlign.center,
                    color: ColorRes.primaryColor,
                  ),
                  onPressed: () {
                    _showModalSheet1();
                  },
                )),
          ),
          Expanded(
            flex: 5,
            child: Container(
                height: 50,
                //width: 180,
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
          ),
        ],
      ),
    );
  }

  iconShow(IconData icons, int i) {
    return InkResponse(
      onTap: () {
        if (i == 1) {
        } else {}
      },
      child: Container(
        height: 40,
        width: 40,
        margin: EdgeInsets.only(top: 10, right: 7),
        decoration: BoxDecoration(boxShadow: [
          new BoxShadow(
            offset: Offset(0.5, 0.5),
            color: ColorRes.greyColor,
            blurRadius: 0.5,
          ),
        ], color: ColorRes.whiteColor, shape: BoxShape.circle),
        child: Icon(
          icons,
          size: 25,
          color: ColorRes.primaryColor,
        ),
      ),
    );
  }

  listData() {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              StringRes.Title1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Text(
              StringRes.Description,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 7),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.check_circle,
                  size: 25,
                  color: ColorRes.primaryColor,
                ),
                Container(
                  padding: EdgeInsets.only(left: 7),
                  child: AllText(
                    "Qualifications",
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 7),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.check_circle,
                  size: 25,
                  color: ColorRes.primaryColor,
                ),
                Container(
                  padding: EdgeInsets.only(left: 7),
                  child: AllText(
                    "Qualifications",
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 7),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.check_circle,
                  size: 25,
                  color: ColorRes.primaryColor,
                ),
                Container(
                  padding: EdgeInsets.only(left: 7),
                  child: AllText(
                    "Qualifications",
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Image.asset(
              Utils.getAssetsImg('productimge2'),
              height: 200,
              width: 300,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 30),
            child: Text(
              StringRes.Description1,
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //review tab in using rating this screen
  ReviewsTab() {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 20, left: 10, bottom: 10),
            child: Text(
              StringRes.Title1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          Row(children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[starRating(5.0)]),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    // padding: EdgeInsets.only(top:10,left: 10, right: 10),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: new LinearPercentIndicator(
                        width: 150.0,
                        lineHeight: 10.0,
                        percent: 0.8,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Colors.black12,
                        progressColor: Colors.blue,
                      ),
                    ),
                  ),
                ]),
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    // padding: EdgeInsets.only(top:10,left: 10, right: 10),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text("2022"),
                    ),
                  ),
                ])
          ]),
          Row(children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[starRating(4.0)]),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    // padding: EdgeInsets.only(top:10,left: 10, right: 10),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: new LinearPercentIndicator(
                        width: 150.0,
                        lineHeight: 10.0,
                        percent: 0.5,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Colors.black12,
                        progressColor: Colors.blue,
                      ),
                    ),
                  ),
                ]),
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    // padding: EdgeInsets.only(top:10,left: 10, right: 10),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text("544"),
                    ),
                  ),
                ])
          ]),
          Row(children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[starRating(3.0)]),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    // padding: EdgeInsets.only(top:10,left: 10, right: 10),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: new LinearPercentIndicator(
                        width: 150.0,
                        lineHeight: 10.0,
                        percent: 0.6,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Colors.black12,
                        progressColor: Colors.blue,
                      ),
                    ),
                  ),
                ]),
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    // padding: EdgeInsets.only(top:10,left: 10, right: 10),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text("122"),
                    ),
                  ),
                ])
          ]),
          Row(children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[starRating(2.0)]),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    // padding: EdgeInsets.only(top:10,left: 10, right: 10),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: new LinearPercentIndicator(
                        width: 150.0,
                        lineHeight: 10.0,
                        percent: 0.7,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Colors.black12,
                        progressColor: Colors.blue,
                      ),
                    ),
                  ),
                ]),
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    // padding: EdgeInsets.only(top:10,left: 10, right: 10),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text("89"),
                    ),
                  ),
                ])
          ]),
          Row(children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[starRating(1.0)]),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    // padding: EdgeInsets.only(top:10,left: 10, right: 10),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: new LinearPercentIndicator(
                        width: 150.0,
                        lineHeight: 10.0,
                        percent: 0.9,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Colors.black12,
                        progressColor: Colors.blue,
                      ),
                    ),
                  ),
                ]),
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    // padding: EdgeInsets.only(top:10,left: 10, right: 10),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text("12"),
                    ),
                  ),
                ])
          ]),
          Container(
              child: Column(children: <Widget>[
            reviewDetails(),
          ]))
        ],
      ),
    );
  }

  starRating(item) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10.0, right: 5.0),
      child: SmoothStarRating(
        size: 25,
        rating: item,
        filledIconData: Icons.star,
        //halfFilledIconData: Icons.star_half,
        defaultIconData: Icons.star_border,
        color: Color(hexColor('#f3cb54')),
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

  reviewDetails() {
    return Container(
      // height: 500,
      alignment: Alignment.topLeft,
      // color: ColorRes.lightWhite,
      // color: Colors.red,
      width: Utils.getDeviceWidth(context),
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 15),
          Container(
            height: 175,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
//        physics: NeverScrollableScrollPhysics(),
              itemCount: listTitle.length,
              padding: EdgeInsets.only(left: 10, right: 10),
              itemBuilder: (context, index) {
                return Container(
                  width: 280,
                  padding: EdgeInsets.only(left: 8, right: 8),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  color: ColorRes.whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          StringRes.Title1,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Column(
//                  mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            padding:
                                EdgeInsets.only(top: 5, left: 10, bottom: 5),
                            child: Text(
                              StringRes.DateFormat,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black26,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          starRating(4.0),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              StringRes.Description,
                              maxLines: 4,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
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
                    margin: EdgeInsets.only(left: 10, right: 10),
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
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
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

  //dialog box show in image
  void dialogBoxShow() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              elevation: 0.0,
              backgroundColor: Colors.white,
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Image.asset(
                          Utils.getAssetsImg('dialogimg'),
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 30),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Added to cart',
                            style: TextStyle(
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
                    margin: EdgeInsets.only(left: 10, right: 10),
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
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: FilledButton(
                        text: StringRes.continueText,
                        fontSize: 18,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderSummaryScreen()));
                        }),
                  ),
                ),
              ],
            )),
          );
        });
  }
}
