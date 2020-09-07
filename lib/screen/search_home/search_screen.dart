import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/filled_button.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/search_home/search_tabs_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final int i;

  const SearchScreen({Key key, this.i}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.lightWhite,
        bottomNavigationBar: Container(
          height: 60,
          child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: FilledButton(
                text: StringRes.continueText,
                fontSize: 18,
                onPressed: () {
                  selectTireScreenNavigator(context);
                },
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 110,
                color: ColorRes.whiteColor,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                            icon: Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 25,
                              ),
                            ),
                            onPressed: () {
                              navigatorPop(context);
                            }),
                        // search text filed
                        Container(
                          height: 50,
                          width: Utils.getDeviceWidth(context) / 1.2,
                          margin: EdgeInsets.only(top: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Search here...',
                              filled: true,
                              fillColor: ColorRes.whiteColor,
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              prefixIcon: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  size: 20,
                                ),
                              ),
                              hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                                letterSpacing: 1.0,
                                fontSize: 15,
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                                borderSide: BorderSide(
                                    width: 1, color: ColorRes.greyColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                                borderSide: BorderSide(
                                    width: 1, color: ColorRes.greyColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1, color: ColorRes.greyColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      // textColor: ColorRes.lightBlur,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: EdgeInsets.only(top: 20, right: 15),
                            child: AllText("More Option",
                                align: TextAlign.right,
                                color: ColorRes.lightBlur)),
                      ),
                      onTap: () {
                        searchScreensNavigator(context);
                      },
                    )
                  ],
                ),
              ),

              Padding(
                  padding: EdgeInsets.only(left: 10, top: 25),
                  child: AllText(
                    "Search results",
                    fontSize: 17,
                    color: ColorRes.blackColor,
                    fontWeight: FontWeight.bold,
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 5, bottom: 25),
                  child: AllText("225/45/R17", color: ColorRes.blackColor)),

              gridImage(),

//          Expanded(child: )
            ],
          ),
        ),
      ),
    );
  }



  //grid image are using image and text are grid view
  gridImage() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 6,
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: Utils.getDeviceWidth(context) /
              (Utils.getDeviceHeight(context) / 1.0)),
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Container(
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
            Padding(
                padding: EdgeInsets.only(left: 0, right: 0, top: 10),
                child: FilledButton(text: "Compare(1)", fontSize: 18))
          ],
        );
      },
    );
  }
}
