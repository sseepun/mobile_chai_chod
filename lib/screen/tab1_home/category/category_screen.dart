import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/config/app_theme.dart';
import 'package:ChaiChod/screen/tab1_home/category/product/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'goodyear/goodyear_screen.dart';
import '../../tab1_home/category/product/product_screen.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  //list if images
  List<String> images = [
    Utils.getAssetsImg('slide_goodyear'),
    Utils.getAssetsImg('deeston'),
    Utils.getAssetsImg('continatale'),
    Utils.getAssetsImg('toyo'),
  ];

  //list of string List
  List<String> stringList1 = [
    'GOODYEAR',
    'DEESTONE',
    'CONTINENTAL',
    'TOYO',
  ];
  List<String> listTitle = ['goodyear1', 'goodyear2', 'goodyear3', 'goodyear4'];

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
            actions: [
              CommonView.searchIconButton(context),
              CommonView.cartIconButton(context, 2, 4),
            ],
            bottom: PreferredSize(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 16),
                child: Text(
                  StringRes.categoryTitle,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppTheme.subHeaderSmallStyle,
                ),
              ),
              preferredSize: Size(0.0, 40.0),
            ),
          ),
          backgroundColor: ColorRes.lightWhite,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 15),
                CommonView.titleText(StringRes.brand),
                SizedBox(height: 10),
                categoryList(),
                SizedBox(height: 15),
                gridImage(),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int currentIndex;

  categoryList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 120,
          child: ListView.builder(
              itemCount: images.length,
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                currentIndex = index;
                return InkResponse(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GoodYearScreen()),
                      );
                    } else if (index == 1) {
                    } else if (index == 2) {
                    } else if (index == 3) {
                    } else if (index == 4) {}
                  },
                  child: Container(
//              height: 200,
                    width: 100,
                    margin: EdgeInsets.only(left: 10),
//              decoration: BoxDecoration(color: ColorRes.whiteColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            child: Image(
                                image: AssetImage(images[index]),
                                fit: BoxFit.fill)),
                        Container(
                            height: 25,
                            alignment: Alignment.bottomCenter,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            margin: EdgeInsets.only(right: 0),
                            child: AllText(stringList1[index],
                                color: ColorRes.blackColor,
                                maxLine: 1,
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                );
              }),
        ),
        Container(
          height: 3,
          margin: EdgeInsets.only(top: 10),
          width: Utils.getDeviceWidth(context) * 0.20,
//            width: Utils.getDeviceWidth(context) / images.length * 0.80,
          alignment: Alignment.center,
//          color: Colors.black,
          child: Center(
            child: ListView.builder(
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      height: 3,
                      width: 15,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 4),
                      color: currentIndex == index
                          ? Colors.black.withOpacity(0.50)
                          : Colors.grey.withOpacity(0.50));
                }),
          ),
        )
      ],
    );
    /*Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 10),
      child: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkResponse(
              onTap: () {
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GoodYearScreen()),
                  );
                } else if (index == 1) {
                } else if (index == 2) {
                } else if (index == 3) {
                } else if (index == 4) {}
              },
              child: Padding(
                padding: EdgeInsets.only(
                    right: index == images.length - 1 ? 10 : 0, left: 10),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        images[index],
                        height: 80,
                        width: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 5),
                    AllText(stringList1[index],
                        color: ColorRes.blackColor,
                        fontSize: 10,
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            );
          }),
    )*/
    ;
  }

  // grid image  are using grid view image and text
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
