import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/export.dart';
import 'package:ChaiChod/screen/tab1_home/category/product/product_screen.dart';
import 'package:ChaiChod/screen/tab4_user/manage_profile/manage_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<String> images = [
    Utils.getAssetsImg('slide_goodyear'),
    Utils.getAssetsImg('deeston'),
    Utils.getAssetsImg('continatale'),
    Utils.getAssetsImg('toyo'),
  ];

  List<String> stringList1 = [
    'GOODYEAR',
    'DEESTONE',
    'CONTINENTAL',
    'TOYO',
  ];
  List<String> listTitle = [
    'goodyear1',
    'goodyear2',
    'goodyear3',
    'goodyear4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.lightWhite,

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            _appBar(),
            SizedBox(height: 10),
            titleText(),
            SizedBox(height: 10),
            ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return categoryList(index);
                }),
            gridImage(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
        height: 120,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 50,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(top: 15),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
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
                  padding: EdgeInsets.only(left: 235, top: 25),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          print('Shopping Cart');
                          cartScreenNavigator(context);
                        },
                        padding: EdgeInsets.only(
                          bottom: 20,
                          right: 5,
                        ),
                        icon: Icon(Icons.search),
                        iconSize: 28,
                        color: ColorRes.primaryColor,
                      ),
                      IconButton(
                        onPressed: () {
                          print('Shopping Cart');
                          cartScreenNavigator(context);
                        },
                        padding: EdgeInsets.only(
                          bottom: 20,
                          right: 20,
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
            Container(
              child: AllText(
                StringRes.categoryTitle,
                color: ColorRes.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }

  titleText() {
    return Padding(
      padding: EdgeInsets.only(
        right: 280,
        left: 2,
        top: 5
      ),
      child: AllText(
        StringRes.brand,
        color: ColorRes.blackColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  categoryList(int index) {
    return InkResponse(
      onTap: () {
        if (index == 0) {
        } else if (index == 1) {
        } else if (index == 2) {
        } else if (index == 3) {
        } else if (index == 4) {}
      },
      child: Container(
        height: 100,
        child: ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 5, bottom: 10, top: 0, right: 5),
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
                    Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Column(
                          children: <Widget>[
                            AllText(stringList1[index],
                                color: ColorRes.blackColor,
                                fontSize: 10,
                                overflow: TextOverflow.ellipsis),
                          ],
                        )),
                  ],
                ),
              );
            }),
      ),
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
        return InkResponse(
          onTap: () {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>ProductScreen()),
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
          ),
        );


      },
    );
  }
}
