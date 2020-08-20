import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listTitle = ['goodyear1','goodyear2','goodyear3','goodyear4'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: ColorRes.lightWhite,
      body: SingleChildScrollView(
            child: Column(
//              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                searchTextFiled(),
                SizedBox(height: 10),
                sideImage(),
                SizedBox(height: 20),
                titleText(StringRes.chooseHereTitle),
                SizedBox(height: 20),
                categoryList(),
                SizedBox(height: 20),
                bannerImages(),
                SizedBox(height: 20),
                titleText(StringRes.promotionTitle),
                SizedBox(height: 20),
                gridImage(),
                SizedBox(height: 20),
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
        height: 50,
        alignment: Alignment.topCenter,
        child: CommonView.logoImage(125,45),
//        child: Image.asset(Utils.getAssetsImg('logo')),
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
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: OutlineButton(
        color: Colors.white,
        child: TextFormField(
          autofocus: false,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(2)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(2)),
            filled: true,
            fillColor: const Color(0xFFFFFFFF),
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(2)),
            hintText: 'Search here...',
            hintStyle: TextStyle(
              fontFamily: 'Roboto',
              letterSpacing: 1.0,
              fontSize: 15,
            ),
            prefixIcon: IconButton(
              icon: Icon(
                Icons.search,
                size: 20,
              ),
            ),
            contentPadding: EdgeInsets.fromLTRB(0, 10.0, 0.0, 15.0),
          ),
        ),
        onPressed: () {},
        borderSide: BorderSide(
          color: Colors.black26,
          width: 0.8, //width of the border
        ),
      ),
    );
  }

  sideImage() {
   /* return Container(
      child: Image.asset(
        Utils.getAssetsImg('car'),
        width: 370,
        height: 210,
        fit: BoxFit.fill,
      ),
    );*/
   return Container(
     height: Utils.getDeviceWidth(context) / 1.6,
      child: SizedBox(
        height: 150.0,
//        width: 300.0,
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
//            NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
//            NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
            ExactAssetImage('assets/images/car_1.jpg'),
            ExactAssetImage('assets/images/car_2.jpg'),
            ExactAssetImage('assets/images/car_3.jpg'),
          ],
        ),
      ),
    /* child: Swiper(
       itemBuilder: (BuildContext context,int index){
         return new Image.network("http://via.placeholder.com/350x150", fit: BoxFit.fill,);
       },
       itemCount: 3,

       pagination: new SwiperPagination(),
       control: new SwiperControl(),
     ),*/
   );
  }

  titleText(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 10, ),
      child: AllText(
        title,
        color: ColorRes.blackColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

   categoryList() {
    return Container(
      height: 200,
      child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
//          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 10, bottom: 0, top: 0, right: 0),
              decoration: BoxDecoration(
                  color: ColorRes.whiteColor
              ),
              child: Column(
                children: <Widget>[

                  Expanded(child: Image(image: AssetImage(Utils.getAssetsImg('0car')), fit: BoxFit.fill)),

                  Container(
                    height: 50,
                    width: 150,
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                        children: <Widget>[
                          AllText("Tires sedands, pickup", color: ColorRes.blackColor, maxLine: 1, overflow: TextOverflow.ellipsis),
                          AllText("Super car", color: ColorRes.blackColor, maxLine: 1, overflow: TextOverflow.ellipsis)
                        ],
                      )
                  ),
                ],
              ),
            );
          }),
    );
  }

  bannerImages() {
    return Container(
      height: 225,
      child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 0),
//          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
        return Container(
            margin: EdgeInsets.only(right: 10),
            child: Image(image: AssetImage(Utils.getAssetsImg('3one1')), fit: BoxFit.fill));
      }),
    );
  }

  gridImage() {
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listTitle.length,
        padding: EdgeInsets.only(left: 10, right: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: Utils.getDeviceWidth(context) /
                (Utils.getDeviceHeight(context) / 1.25)
        ),
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
                    AllText("GOODYEAR", color: ColorRes.blackColor,),
                    AllText("Tires 225/45/R17", color: ColorRes.blackColor,),
                    AllText("\$2,000 /len.", color: ColorRes.blackColor,)
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
      ),
    );
  }
}
