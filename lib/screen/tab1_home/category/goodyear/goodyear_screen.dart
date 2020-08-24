import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/tab1_home/category/product/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoodYearScreen extends StatefulWidget {
  @override
  _GoodYearScreenState createState() => _GoodYearScreenState();
}

class _GoodYearScreenState extends State<GoodYearScreen> {
  List<String> listTitle = [
    'goodyear1',
    'goodyear2',
    'goodyear3',
    'goodyear4',
    'goodyear1',
    'goodyear2',
    'goodyear3',
    'goodyear4',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.lightWhite,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              appBar(),
              SizedBox(height: 10),
              gridImage(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Container(
        color: Colors.white,
//        margin: EdgeInsets.only(bottom: 4),
        padding: EdgeInsets.only(bottom: 15),
        child: Stack(
          children: <Widget>[
            CommonView.backArrow(context),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 130, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      AllText(
                        StringRes.goodyear,
                        color: ColorRes.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.only(right: 5),
                              icon: Icon(Icons.search),
                              iconSize: 28,
                              color: ColorRes.primaryColor,
                            ),
                            IconButton(
                              onPressed: () {
                                cartScreenNavigator(context);
                              },
                              padding: EdgeInsets.only(right: 20),
                              icon: Icon(Icons.shopping_basket),
                              iconSize: 28,
                              color: ColorRes.primaryColor,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
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
              (Utils.getDeviceHeight(context) / 1.30)),
      itemBuilder: (context, index) {
        return InkResponse(
          onTap: () {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductScreen()),
              );
            } else if (index == 1) {
            } else if (index == 2) {
            } else if (index == 3) {
            } else if (index == 4) {}
          },
          child: Container(
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
                    SizedBox(height: 10),
                    AllText(
                      "\$2,000 /len.",
                      color: ColorRes.blackColor,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
