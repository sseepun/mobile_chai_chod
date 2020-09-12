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
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
    showPerBottomSheetCallBack = showModalSheet1;
    showPerBottomSheetCallBack = showModalSheet2;
    tabController = TabController(length: 2, vsync: this);
  }

  hexColor(String colorhexcode) {
    String color= '0xff' + colorhexcode;
    color= color.replaceAll('#', '');
    int colorint = int.parse(color);
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
            leading: CommonView.backIconButton(context),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'รายละเอียดสินต้า',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTheme.subHeaderSmallStyle,
            ),
            actions: [
              CommonView.cartIconButton(context, 2, 11),
            ],
          ),
          backgroundColor: ColorRes.whiteColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                userOptions(),
                productDisplay(),
                SizedBox(height: 1),
                Divider(height: 1, color: ColorRes.greyColor),
                SizedBox(height: 1),
                productDetails(),
                SizedBox(height: 20),
                productDetailTabs(),
                listProductData(),
                SizedBox(height: 30),
                productButtons(),
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
              favIcon(Icons.favorite, 1),
              favIcon(Icons.share, 2),
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
                color: ColorRes.primaryColor,
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
      height: 860,
      child: Column(
        children: <Widget>[
          CommonView.titleText(StringRes.ProductTitle1),
          SizedBox(height: 5),
          TabBar(
            indicatorColor: ColorRes.primaryColor,
            indicatorWeight: 4,
            labelColor: ColorRes.primaryColor,
            unselectedLabelColor: Colors.grey,
            isScrollable: false,
            labelStyle: AppTheme.tabTextStyle,
            tabs: <Tab>[
              Tab(child: Text(StringRes.tab1)),
              Tab(child: Text(StringRes.tab2)),
            ],
            controller: tabController,
          ),
          Expanded(
            child: TabBarView(
              children: [
                listData(),
                reviewsTab(),
              ],
              controller: tabController,
            ),
          ),
        ],
      ),
    );
  }

  favIcon(IconData icons, int i) {
    return InkResponse(
      onTap: () {
        if (i == 1) {
        } else {}
      },
      child: Container(
        height: 40,
        width: 40,
        margin: EdgeInsets.only(top: 8, right: 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            offset: Offset(0.5, 2),
            color: Colors.black12,
            blurRadius: 3,
          ),
        ], color: ColorRes.whiteColor, shape: BoxShape.circle),
        child: Icon(
          icons,
          size: 22,
          color: ColorRes.primaryColor,
        ),
      ),
    );
  }

  //list data in using details tab
  listData() {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
            child: Text(
              StringRes.Title1,
              style: AppTheme.descSemiboldStyle,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Text(
              StringRes.Description,
              style: AppTheme.productDescStyle,
            ),
          ),
          SizedBox(height: 10),
          checklist('Qualifications'),
          checklist('Qualifications'),
          checklist('Qualifications'),
          SizedBox(height: 20),
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
            padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
            child: Text(
              StringRes.Description1,
              style: AppTheme.productDescStyle,
            ),
          ),
        ],
      ),
    );
  }

  checklist(String text) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.check_circle,
            size: 22,
            color: ColorRes.primaryColor,
          ),
          Container(
            padding: EdgeInsets.only(left: 7),
            child: Text(
              text,
              style: AppTheme.productDescStyle,
            ),
          ),
        ],
      ),
    );
  }

  //review tab in using review tab
  reviewsTab() {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
            child: Text(
              'รีวิวจากลูกค้า (21903)',
              style: AppTheme.descSemiboldStyle,
            ),
          ),
          ratingRow(5.0, 0.8, '2022'),
          ratingRow(4.5, 0.5, '544'),
          ratingRow(2.0, 0.6, '122'),
          ratingRow(3.5, 0.75, '89'),
          ratingRow(1, 0.4, '12'),
          Container(
            child: Column(
              children: <Widget>[
                reviewDetails(),
              ]
            )
          ),
        ],
      ),
    );
  }

  ratingRow(double rating, double percentage, String desc) {
    return Row(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[ starRating(rating) ]
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: LinearPercentIndicator(
                  width: 150.0,
                  lineHeight: 10.0,
                  percent: percentage,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  backgroundColor: Colors.black12,
                  progressColor: ColorRes.primaryColor,
                ),
              ),
            ),
          ]
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              // padding: EdgeInsets.only(top:10,left: 10, right: 10),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  desc
                ),
              ),
            ),
          ]
        ),
      ]
    );
  }

  //review tab in rate in properties
  starRating(item) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10.0, right: 5.0),
      child: SmoothStarRating(
        size: 25,
        rating: item,
        filledIconData: Icons.star,
        defaultIconData: Icons.star_border,
        color: Color(hexColor('#f3cb54')),
        borderColor: Color(hexColor('#f3cb54')),
        starCount: 5,
        allowHalfRating: true,
        spacing: 1.0,
        // onRated: (value) {
        //   setState(() {
        //     rating = value ;
        //   });
        // },
      ),
    );
  }

  //review tab in card design
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

  listProductData() {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      alignment: Alignment.topLeft,
      color: ColorRes.bgColor,
      width: Utils.getDeviceWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          CommonView.titleText(StringRes.ProductTitle3),
          SizedBox(height: 15),
          Container(
            height: 300,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: listTitle.length,
              padding: EdgeInsets.only(left: 5, right: 15),
              itemBuilder: (context, index) {
                return InkResponse(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductScreen()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    color: ColorRes.whiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Image(
                            image: AssetImage(Utils.getAssetsImg('tiers')),
                            width: 200,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "GOODYEAR",
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.productNameStyle,
                              ),
                              Text(
                                "ยางรถยนต์ 225/45/R17",
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.productDescStyle
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: <Widget> [
                                  Text(
                                    "\$2,000",
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTheme.productPriceStyle,
                                  ),
                                  Text(
                                    " /เส้น",
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTheme.productUnitStyle,
                                  )
                                ]
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //bottom in two button design
  productButtons() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              height: 58,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorRes.primaryColor,
                )
              ),
              child: FlatButton(
                color: ColorRes.whiteColor,
                child: Text(
                  StringRes.btn1,
                  style: AppTheme.btnTextPrimaryStyle
                ),
                onPressed: () {
                  showModalSheet1();
                },
              )
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              height: 58,
              margin: EdgeInsets.only(left: 10),
              child: FlatButton(
                color: ColorRes.primaryColor,
                child: Text(
                  StringRes.btn2,
                  style: AppTheme.btnTextStyle,
                ),
                onPressed: () {
                  showModalSheet2();
                },
              )
            ),
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
        return Container(
          color: Colors.white,
          child: Center(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 5),
                productDisplay(),
                SizedBox(height: 1),
                Divider(height: 1, color: ColorRes.greyColor),
                SizedBox(height: 1),
                productDetails(),
                Container(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          onPressed: minus,
                          child: Icon(
                            const IconData(
                              0xe15b,
                              fontFamily: 'MaterialIcons'
                            ),
                            color: Colors.black
                          ),
                        ),
                        Text(
                          '$_n', 
                          style: AppTheme.subHeaderStyle
                        ),
                        FlatButton(
                          onPressed: add,
                          child: Icon(
                            Icons.add,
                            color: ColorRes.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: FilledButton(
                      height: 58,
                      text: StringRes.btn1details,
                      fontSize: 20.0,
                      onPressed: () {
                        dialogBoxShow();
                      }
                    ),
                  ),
                ),
              ],
            )
          ),
        );
      }
    );
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
                    width: 140,
                    fit: BoxFit.fill,
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 28),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'เพิ่มเข้าตระกร้าแล้ว',
                        textAlign: TextAlign.center,
                        style: AppTheme.subHeaderBoldStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        );
      }
    );
  }

  //bottom buy now button use the  showModalSheet2 and modelSheet is a bottom sheet
  void showModalSheet2() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          color: Colors.white,
          child: Center(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 5),
                productDisplay(),
                SizedBox(height: 1),
                Divider(height: 1, color: ColorRes.greyColor),
                SizedBox(height: 1),
                productDetails(),
                Container(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          onPressed: minus,
                          child: Icon(
                            const IconData(
                              0xe15b,
                              fontFamily: 'MaterialIcons'
                            ),
                            color: Colors.black
                          ),
                        ),
                        Text(
                          '$_n', 
                          style: AppTheme.subHeaderStyle
                        ),
                        FlatButton(
                          onPressed: add,
                          child: Icon(
                            Icons.add,
                            color: ColorRes.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: FilledButton(
                      height: 58,
                      text: StringRes.continueText,
                      fontSize: 20.0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderSummaryScreen()
                          )
                        );
                      }
                    ),
                  ),
                ),
              ],
            )
          ),
        );
      }
    );
  }
}
