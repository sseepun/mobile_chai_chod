import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/tab1_home/category/product/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'goodyear/goodyear_screen.dart';

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
  List<String> listImage = ['goodyear1', 'goodyear2', 'goodyear3', 'goodyear4'];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
        bottom: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25,
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.white,
          title: Text(
            StringRes.categoryTitle,
            style: TextStyle(color: Colors.black),
          ),
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
        ),
        backgroundColor: ColorRes.lightWhite,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // appBar(),
              SizedBox(height: 10),
              titleText(),
              SizedBox(height: 10),
              categoryList(),
              SizedBox(height: 10),
              gridImage(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
        ),);
  }

//   Widget appBar() {
//     return Container(
//         color: Colors.white,
// //        margin: EdgeInsets.only(bottom: 4),
//         padding: EdgeInsets.only(bottom: 15),
//         child: Stack(
//           children: <Widget>[
//             CommonView.backArrow(context),
//             Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(top: 12),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       IconButton(
//                         onPressed: () {},
//                         padding: EdgeInsets.only(bottom: 10, right: 5),
//                         icon: Icon(Icons.search),
//                         iconSize: 28,
//                         color: ColorRes.primaryColor,
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           cartScreenNavigator(context);
//                         },
//                         padding: EdgeInsets.only(bottom: 10, right: 20),
//                         icon: Icon(Icons.shopping_basket),
//                         iconSize: 28,
//                         color: ColorRes.primaryColor,
//                       ),
//                     ],
//                   ),
//                 ),
//                 AllText(
//                   StringRes.categoryTitle,
//                   color: ColorRes.blackColor,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ],
//             ),
//           ],
//         ));
//   }

  titleText() {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 5),
      child: AllText(
        StringRes.brand,
        align: TextAlign.left,
        color: ColorRes.blackColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  int currentIndex;

  categoryList() {
    return Column(
//      mainAxisAlignment: MainAxisAlignment.center,
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

                return Container(
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
                              fit: BoxFit.fill)
                      ),
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
                );
              }),
        ),
        Container(
          height: 3,
          margin: EdgeInsets.only(top: 10),
          width: Utils.getDeviceWidth(context) / images.length * 0.70,
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
                  color: currentIndex == index ? Colors.black.withOpacity(0.50) : Colors.grey.withOpacity(0.50));
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
    )*/;
  }

// grid image  are using grid view image and text
  gridImage() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listImage.length,
      padding: EdgeInsets.only(left: 10, right: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.68
          // childAspectRatio: Utils.getDeviceWidth(context) /
          //     (Utils.getDeviceHeight(context) / 1.20),
          ),
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
