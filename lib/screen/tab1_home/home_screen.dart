import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/config/app_theme.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category/category_screen.dart';
import '../tab1_home/category/product/product_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listTitle = ['goodyear1', 'goodyear2', 'goodyear3', 'goodyear4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            searchTextFiled(),
            SizedBox(height: 10),
            sideImage(),
            SizedBox(height: 15),
            CommonView.titleText(StringRes.chooseHereTitle),
            SizedBox(height: 15),
            ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return categoryList(index);
              }
            ),
            SizedBox(height: 20),
            bannerImages(),
            SizedBox(height: 25),
            CommonView.titleText(StringRes.promotionTitle),
            SizedBox(height: 15),
            gridImage(),
            SizedBox(height: 15),
          ],
        ),
      )
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Container(
        alignment: Alignment.center,
        child: CommonView.logoImage(110, 0),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            print('Shopping Cart');
            cartScreenNavigator(context);
          },
          padding: EdgeInsets.only(
            right: 15,
          ),
          icon: Icon(Icons.shopping_basket),
          iconSize: 28,
          color: ColorRes.primaryColor,
        ),
      ],
    );
  }

  searchTextFiled() {
    return GestureDetector(
      onTap: () {
        searchScreenNavigator(context);
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        height: 40,
        padding: EdgeInsets.only(left: 20, right: 10),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: 20,
              color: Colors.grey,
            ),
            Container(
              width: 20,
            ),
            Container(
              child: Text(
                'Search here...',
                style: TextStyle(
                    letterSpacing: 1.0, fontSize: 15, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // car images side images
  sideImage() {
    return Container(
      height: Utils.getDeviceWidth(context) / 1.6,
      child: SizedBox(
        height: 150.0,
        child: Carousel(
          boxFit: BoxFit.cover,
          autoplay: false,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
          dotSize: 6.0,
          dotIncreasedColor: ColorRes.primaryColor,
          dotBgColor: Colors.transparent,
          dotPosition: DotPosition.bottomCenter,
          dotVerticalPadding: 10.0,
          showIndicator: true,
          indicatorBgPadding: 7.0,
          images: [
            ExactAssetImage('assets/images/car_1.jpg'),
            ExactAssetImage('assets/images/car_2.jpg'),
            ExactAssetImage('assets/images/car_3.jpg'),
          ],
        ),
      ),
    );
  }

  //images text are show in category list method and horizontal scroll
  categoryList(int index) {
    return Container(
      padding: EdgeInsets.only(left: 5),
      child: InkResponse(
        onTap: () {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CategoryScreen()),
            );
          } else if (index == 1) {
          } else if (index == 2) {
          } else if (index == 3) {
          } else if (index == 4) {}
        },
        child: Container(
          height: 200,
          child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: 10, bottom: 0, top: 0, right: 0
                  ),
                  decoration: BoxDecoration(color: ColorRes.whiteColor),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image(
                          image: AssetImage(
                            Utils.getAssetsImg('0car')),
                            fit: BoxFit.fill
                          )
                        ),
                      Container(
                          height: 50,
                          width: 130,
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "ยางรถเก๋ง, รถกระบะ ซูเปอร์คาร์",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: AppTheme.productDescStyle,
                              ),
                            ],
                          )),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  bannerImages() {
    return Container(
      padding: EdgeInsets.only(left: 3),
      height: 220,
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 12),
        // physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 10),
            child: Image(
              image: AssetImage(Utils.getAssetsImg('3one1')),
              fit: BoxFit.fill
            )
          );
        }
      ),
    );
  }

  gridImage() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listTitle.length,
      padding: EdgeInsets.only(left: 15, right: 15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.69
      ),
      itemBuilder: (context, index) {
        return InkResponse(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductScreen()),
            );
          },
          child: Container(
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
    );
  }
  
}
