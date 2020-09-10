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
            leading: IconButton(
              icon: AppTheme.btnBackIcon,
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                color: ColorRes.primaryColor,
              ),
              IconButton(
                icon: Icon(Icons.shopping_basket),
                color: ColorRes.primaryColor,
                onPressed: () {
                  cartScreenNavigator(context);
                },
              ),
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

  categoryList() {
    return Container(
      height: 105,
      padding: EdgeInsets.only(left: 10, right: 15),
      child: ListView.builder(
          itemCount: 6,
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
                } else if (index == 4) {
                } else if (index == 5) {
                } else if (index == 6) {}
              },
              child: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        images[index % 4],
                        height: 80,
                        width: 90,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      stringList1[index % 4],
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.descSmallStyle,
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            );
          }),
    );
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
