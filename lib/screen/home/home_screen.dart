import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScrene extends StatefulWidget {
  @override
  _HomeScreneState createState() => _HomeScreneState();
}

class _HomeScreneState extends State<HomeScrene> {
  List<String> listTitle = [
    Utils.getAssetsImg('goodyear1'),
    Utils.getAssetsImg('goodyear2'),
    Utils.getAssetsImg('goodyear3'),
    Utils.getAssetsImg('goodyear4'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: new Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  searchTextFiled(),
                  SizedBox(height: 10),
                  scrollImage(),
                  SizedBox(height: 20),
                  textFiled(),
                  SizedBox(height: 20),
                  carImages(),
                  SizedBox(height: 20),
                  otherImages(),
                  SizedBox(height: 20),
                  promotionProduct(),
                  SizedBox(height: 20),
                  gridImage(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
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

  scrollImage() {
    return Container(
      child: Image.asset(
        Utils.getAssetsImg('car'),
        width: 370,
        height: 210,
        fit: BoxFit.fill,
      ),
    );
  }

  textFiled() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.centerLeft,
      child: AllText(
        StringRes.heading,
        color: ColorRes.blackColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  carImages() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 7),
              alignment: Alignment.center,
              child: Image.asset(
                Utils.getAssetsImg('car1'),
                width: 160,
                height: 180,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 7),
              alignment: Alignment.center,
              child: Image.asset(
                Utils.getAssetsImg('car2'),
                width: 160,
                height: 180,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 7),
              alignment: Alignment.center,
              child: Image.asset(
                Utils.getAssetsImg('car1'),
                width: 160,
                height: 180,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                Utils.getAssetsImg('car2'),
                width: 160,
                height: 180,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }

  otherImages() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 7),
              alignment: Alignment.center,
              child: Image.asset(
                Utils.getAssetsImg('3one1'),
                width: 310,
                height: 190,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 7),
              alignment: Alignment.center,
              child: Image.asset(
                Utils.getAssetsImg('3one1'),
                width: 310,
                height: 190,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 7),
              alignment: Alignment.center,
              child: Image.asset(
                Utils.getAssetsImg('3one1'),
                width: 310,
                height: 190,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                Utils.getAssetsImg('3one1'),
                width: 310,
                height: 190,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }

  promotionProduct() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.centerLeft,
      child: AllText(
        StringRes.secondHeading,
        color: ColorRes.blackColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  gridImage() {
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listTitle.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (contxt, indx) {
          return Container(
            padding: EdgeInsets.only(left: 5,right: 5),
            child:Container(

              color: Colors.white,
                margin: EdgeInsets.only(bottom: 10),
                  child:Column(
                    children: <Widget>[
                      Image.asset(
                       listTitle[indx],
                        width: 300,
                        height: 170,
                       ),
                    ],
                  ),
            ),
          );
        },
      ),
    );
  }
}
