import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/filled_button.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'order_summary/order_summary_screen.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
  TabController _tabController;
  double rating = 3.0;
  List<String> listTitle = ['goodyear1', 'goodyear2', 'goodyear3', 'goodyear4'];
  int _n = 1;
  int currentIndexChangeTabBar = 0;
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
    _tabController = new TabController(length: 2, vsync: this);
    showPerBottomSheetCallBack = showModalSheet1;
    showPerBottomSheetCallBack = showModalSheet2;
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
            /*leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),*/
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            title: AllText(StringRes.ProductTitle, color: Colors.black,
            ),

          ),
          backgroundColor: ColorRes.whiteColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // appBar(),
                userLogo(),
                tireNumberShow(),
                SizedBox(height: 10),
                Divider(height: 1, color: ColorRes.greyColor),
                productDetails(),
                // tabbar(),
                tabBarShow(),
                Divider(height: 1, color: ColorRes.greyColor),
                listProductData(),
                twoButton(),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget appBar() {
  //   return Container(
  //       height: 60,
  //       color: Colors.white,
  //       child: Stack(
  //         children: <Widget>[
  //           CommonView.backArrowAndTitle(
  //               context, StringRes.ProductTitle, ColorRes.blackColor),
  //           Align(
  //             alignment: Alignment.centerRight,
  //             child: Padding(
  //               padding: EdgeInsets.only(top: 15),
  //               child: IconButton(
  //                 onPressed: () {
  //                   cartScreenNavigator(context);
  //                 },
  //                 icon: Icon(Icons.shopping_basket),
  //                 iconSize: 28,
  //                 color: ColorRes.primaryColor,
  //               ),
  //             ),
  //           )
  //         ],
  //       ));
  // }

  //user logo show in this method

  userLogo() {
    return Stack(
//      alignment: Alignment.topCenter
      children: <Widget>[
        Center(
          child: Image.asset(
            Utils.getAssetsImg('productimg'),
            height: Utils.getDeviceHeight(context) / 2.3,
//            width: 250,
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Column(
            children: <Widget>[
              GestureDetector(
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
                    Icons.shopping_basket,
                    size: 25,
                    color: ColorRes.primaryColor,
                  ),
                ),
                onTap: () {
                  cartScreenNavigator(context);
                },
              ),
              iconShow(Icons.favorite, 1),
              iconShow(Icons.share, 2),
            ],
          ),
        )
      ],
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

  tireNumberShow() {
    return Padding(
        padding: EdgeInsets.only(left: 10, top: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AllText(
              "NANKANG AS-2+ -205/55R16",
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            SizedBox(height: 8),
            AllText(
              "B2,500",
              color: ColorRes.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            AllText(
              "Per line",
              color: Colors.black,
              fontSize: 14,
            ),
          ],
        ));
  }

  productDetails() {
    return Column(
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
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          color: ColorRes.whiteColor,
          child: CommonView.productDetailsLeftRightData(
              StringRes.width, "195 mm."),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          color: ColorRes.lightWhite,
          child: CommonView.productDetailsLeftRightData(
              StringRes.rubberSeries, "55"),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          color: ColorRes.whiteColor,
          child: CommonView.productDetailsLeftRightData(
              StringRes.rubberEdge, "15"),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          color: ColorRes.lightWhite,
          child: CommonView.productDetailsLeftRightData(
              StringRes.sidewallTxt, "10.72 cm."),
        ),
      ],
    );
  }

  /*tabbar(){
    return Container(
    child: Column(
      children: [
        Container(
          color: ColorRes.whiteColor,
          child: TabBar(
            indicatorColor: ColorRes.primaryColor,
            labelColor: ColorRes.primaryColor,
            isScrollable: false,
            labelStyle: TextStyle(color: ColorRes.primaryColor),
            tabs: <Tab>[
              Tab(child: AllText(StringRes.shipping, fontSize: 17,  color: ColorRes.primaryColor)),
              Tab(child: AllText(StringRes.successDelivery, fontSize: 17, color: ColorRes.primaryColor)),
            ],
            controller: _tabController,
          ),
        ),
        //show the tab bar
        Expanded(
          child: TabBarView(
            children: [
              ProductDetailsScreen(),
              ProductReviewsScreen(),
            ],
            controller: _tabController,
          ),
        ),
      ],
    ),
    );
}*/

  //tab bar heading
  tabBarShow() {
    print(currentIndexChangeTabBar);
    return Container(
      height: currentIndexChangeTabBar == 0 ? 850 : 575,
      color: ColorRes.lightWhite,
      child: Column(
        children: <Widget>[
          CommonView.titleText(StringRes.ProductTitle1),
          SizedBox(height: 5),
          TabBar(
            indicatorColor: ColorRes.primaryColor,
            labelColor: ColorRes.primaryColor,
            isScrollable: false,
            labelStyle: TextStyle(color: ColorRes.primaryColor),
            onTap: (indedx) {

              if (indedx == 0) {
                setState(() {
                  currentIndexChangeTabBar = 0;
                });
              } else if (indedx == 1) {
                setState(() {
                  currentIndexChangeTabBar = 1;
                });
              }


            },
            tabs: <Tab>[
              Tab(
                  child: AllText(StringRes.tab1,
                      fontSize: 17, color: ColorRes.primaryColor)),
              Tab(
                  child: AllText(StringRes.tab2,
                      fontSize: 17, color: ColorRes.primaryColor)),
            ],
            controller: _tabController,
          ),
          Expanded(
            child: TabBarView(
              children: [
                listData(),
                reviewsTab(),
//                  DetailsScreen(),
//                ReviewScreen(),
              ],

              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }


  //list data in using details tab
  listData() {
    currentIndexChangeTabBar = 1;
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

          qualifications(),
          qualifications(),
          qualifications(),

          Center(
            child: Image.asset(
              Utils.getAssetsImg('productimge2'),
              height: 200,
              width: Utils.getDeviceWidth(context),
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

  //review tab in using review tab
  reviewsTab() {
    currentIndexChangeTabBar = 2;
    return Column(
      children: <Widget>[
        Container(
          color: ColorRes.lightWhite,
//          color: ColorRes.lightWhite,
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
        startRatingCountShow(5, 0.8 ,"2022"),
        startRatingCountShow(4, 0.5 ,"544"),
        startRatingCountShow(3, 0.6 ,"122"),
        startRatingCountShow(2, 0.7 ,"89"),
        startRatingCountShow(1, 0.9 ,"12"),
        reviewDetails()
      ],
    );
  }

  //review tab in rate in properties
  starRating(item) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5),
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

  //review tab in card design
  reviewDetails() {
    return Container(
      height: 220,
      alignment: Alignment.topLeft,
      color: ColorRes.lightWhite,
      // color: Colors.red,
      width: Utils.getDeviceWidth(context),
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 15),
          Container(
            height: 190,
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
                                fontSize: 15,
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

  listProductData() {
    return Container(
      // height: 275,
      padding: EdgeInsets.only(bottom: 15),
      alignment: Alignment.topLeft,
      color: ColorRes.lightWhite,
      width: Utils.getDeviceWidth(context),
      margin: EdgeInsets.only(top: 0, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: relatedProducts(),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
//            height: MediaQuery.of(context).size.height * 0.35,
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
                  margin: EdgeInsets.only(left: 8, right: 8),

                  color: ColorRes.whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Image(
//                          width: 70,
//                            height: 130,
                            image: AssetImage(Utils.getAssetsImg('tiers')),
                            fit: BoxFit.fill),
                      ),
                      Container(
                        height: 75,
                        child: Column(
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
                              height: 4,
                            ),
                            AllText(
                              "\$2,000 /len.",
                              color: ColorRes.blackColor,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            height: 3,
            margin: EdgeInsets.only(top: 18),
            width: Utils.getDeviceWidth(context) / listTitle.length * 0.70,
            alignment: Alignment.center,
//          color: Colors.black,
            child: Center(
              child: ListView.builder(
                  itemCount: listTitle.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 3,
                        width: 15,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 4),
                        color: listTitle == index
                            ? Colors.black.withOpacity(0.50)
                            : Colors.grey.withOpacity(0.50));
                  }),
            ),
          )
        ],
      ),
    );
  }

  //bottom in two button design
  twoButton() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 5,
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
                    showModalSheet1();
                  },
                )),
          ),
          Expanded(
            flex: 5,
            child: Container(
                height: 50,
                //width: 180,
                margin: EdgeInsets.only(left: 10),
                child: FlatButton(
                  color: ColorRes.primaryColor,
                  child: AllText(
                    StringRes.btn2,
                    fontSize: 15,
                    color: ColorRes.whiteColor,
                  ),
                  onPressed: () {
                    showModalSheet2();
                  },
                )),
          ),
        ],
      ),
    );
  }

  //bottom transparent trolley button use the  showModalSheet1 and modelSheet is a bottom sheet
  void showModalSheet1() {
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

  //transparent trolley button are click then show dialog box and show in image
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

  //bottom buy now button use the  showModalSheet2 and modelSheet is a bottom sheet
  void showModalSheet2() {
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
                            padding: EdgeInsets.only(top: 5),
                            child: FilledButton(
                                height: 30,
                                text: StringRes.buttonName,
                                fontSize: 12,
                                onPressed: () {}),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                          color: ColorRes.whiteColor,
                          child: CommonView.productDetailsLeftRightData(
                              StringRes.width, "195 mm."),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                          color: ColorRes.lightWhite,
                          child: CommonView.productDetailsLeftRightData(
                              StringRes.rubberSeries, "55"),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                          color: ColorRes.whiteColor,
                          child: CommonView.productDetailsLeftRightData(
                              StringRes.rubberEdge, "15"),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                          color: ColorRes.lightWhite,
                          child: CommonView.productDetailsLeftRightData(
                              StringRes.sidewallTxt, "10.72 cm."),
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

  startRatingCountShow(double startRating, double ratingPercent, String totalCount) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
      starRating(startRating),
      Expanded(
//        alignment: Alignment.center,
        // padding: EdgeInsets.only(top:10,left: 10, right: 10),
        child: Padding(
          padding: EdgeInsets.only(top: 5),
          child: new LinearPercentIndicator(
//            width: 150.0,
            lineHeight: 10.0,
            percent: ratingPercent,
            linearStrokeCap: LinearStrokeCap.roundAll,
            backgroundColor: Colors.black12,
            progressColor: Colors.blue,
          ),
        ),
      ),
      Container(
        width: 50,
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(right: 10, top: 5),
        // padding: EdgeInsets.only(top:10,left: 10, right: 10),
        child: AllText(totalCount, align: TextAlign.right),
      )
    ]);
  }

  qualifications() {
    return  Container(
      margin: EdgeInsets.only(bottom: 10),
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
    );
  }
}
