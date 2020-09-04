import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/filled_button.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/material.dart';

class SearchTabsScreen extends StatefulWidget {
  @override
  _SearchTabsScreenState createState() => _SearchTabsScreenState();
}

class _SearchTabsScreenState extends State<SearchTabsScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  TabController tabController;
  var currentSelectedValue;
  String _dropDownValue;
  final deviceTypes = ["Mac", "Windows", "Mobile"];
  final deviceTypes1= ["Mac2", "Windows2", "Mobile2"];
  final deviceTypes2= ["Mac3", "Windows3", "Mobile3"];

  String _mySelection;
 // final deviceTypes = [{"id":0,"name":"<New>"},{"id":1,"name":"Test Practice"}];



  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.lightWhite,
        bottomNavigationBar: Container(
          height: 60,
          child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: FilledButton(text: StringRes.continueText, fontSize: 18)),
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
//                    Align(
//                      alignment: Alignment.centerRight,
                    GestureDetector(
                      // textColor: ColorRes.lightBlur,
                      child: Padding(
                          padding: EdgeInsets.only(top: 20,left: 250),
                          child: AllText("More Option",align: TextAlign.right,color: ColorRes.lightBlur)),
                      onTap: () {
                        searchTabsScreenNavigator(context);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 320,
                color: ColorRes.whiteColor,
                child: Column(
                  children: <Widget>[
                    TabBar(
                      indicatorColor: ColorRes.primaryColor,
                      labelColor: ColorRes.primaryColor,
                      isScrollable: false,
                      labelStyle: TextStyle(color: ColorRes.primaryColor),
                      tabs: <Tab>[
                        Tab(
                            child: AllText(StringRes.Searchtab1,
                                fontSize: 17, color: ColorRes.primaryColor)),
                        Tab(
                            child: AllText(StringRes.Searchtab2,
                                fontSize: 17, color: ColorRes.primaryColor)),
                        Tab(
                            child: AllText(StringRes.Searchtab3,
                                fontSize: 17, color: ColorRes.primaryColor)),
                      ],
                      controller: tabController,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          listDataTab1(),
                          listDatatab2(),
                          listDatatab3(),
                         ],
                        controller: tabController,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 25),
                  child: AllText("Search results", color: ColorRes.blackColor)),
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 5, bottom: 25),
                  child: AllText("225/45/R17", color: ColorRes.blackColor)),
              gridImage(),
            ],
          ),
        ),
      ),
    );
  }

  //-------------------------------Tab1-----------------------------------------//
  listDataTab1() {
    return Container(
      height: 100,
      child: new Column(
        children: <Widget>[
          Container(
            padding: new EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                tabs(),
                tabs(),
                tabs(),
              ],
            ),
          ),
          Container(
              height: 50,
              width: 180,
              child: FilledButton(text: "submit", fontSize: 18))
        ],
      ),
    );
  }

  //-------------------------------Tab2-----------------------------------------//
  listDatatab2() {
    return Container(
     // height: 200,
      alignment: Alignment.center,
      child: new Column(
        children: <Widget>[
          new Padding(
              padding:
              new EdgeInsets.all(0.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: new EdgeInsets.all(0.0),
                    child: Column(
                      children: <Widget>[
                        new Container(
                          padding: new EdgeInsets.only(left:10, top: 8,right: 130),
                          child: Text(
                            'XYZ',
                            style: new TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        new Padding(
                          padding:
                          new EdgeInsets.only(left: 10, right:5, top: 10, bottom: 10),
                          child: DropdownButtonHideUnderline(
                            child: Container(
                              height: 45,
                              width: 165,
                              //width: MediaQuery.of(context).size.width,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2.0,
                                    style: BorderStyle.solid,
                                    //#eceef0
                                    color: Color(hexColor('#f0f2f3')),
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                ),
                              ),
                              child: DropdownButton<String>(
                                // pring(currentSelectedValue),
                                // hint: Text("Select Device"),
                                // itemHeight: 10,
                                underline: SizedBox(

                                ),
                                value: currentSelectedValue,
                                isDense: true,
                                // isExpanded: true,
                                icon: Container(
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 32,
                                    color: Colors.blue,
                                  ),
                                ),
                                hint: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Select",
                                    style: TextStyle(color: Colors.black, fontSize: 13),
                                  ),
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    currentSelectedValue = newValue;
                                  });
                                  print(currentSelectedValue);
                                },
                                items: deviceTypes.map(( String value) {
                                  // print(value);

                                  return DropdownMenuItem<String>(

                                    value:value,
                                    child: Padding(
                                      //Ma:const EdgeInsets.all(8.0),

                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        value,

                                        style:
                                        new TextStyle(color: Colors.black, fontSize: 13),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: new EdgeInsets.all(0.0),
                    child: Column(
                      children: <Widget>[
                        new Container(
                          padding: new EdgeInsets.only( top: 8,right: 130),
                          child: Text(
                            'XYZ',
                            style: new TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        new Padding(
                          padding:
                          new EdgeInsets.only(left:2, right: 5, top: 10, bottom: 10),
                          child: DropdownButtonHideUnderline(
                            child: Container(
                              height: 45,
                              width: 165,
                              //width: MediaQuery.of(context).size.width,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2.0,
                                    style: BorderStyle.solid,
                                    //#eceef0
                                    color: Color(hexColor('#f0f2f3')),
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                ),
                              ),
                              child: DropdownButton<String>(
                                // pring(currentSelectedValue),
                                // hint: Text("Select Device"),
                                // itemHeight: 10,
                                underline: SizedBox(

                                ),
                                value: currentSelectedValue,
                                isDense: true,
                                // isExpanded: true,
                                icon: Container(
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 32,
                                    color: Colors.blue,
                                  ),
                                ),
                                hint: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Select",
                                    style: TextStyle(color: Colors.black, fontSize: 13),
                                  ),
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    currentSelectedValue = newValue;
                                  });
                                  print(currentSelectedValue);
                                },
                                items: deviceTypes.map(( String value) {
                                  // print(value);

                                  return DropdownMenuItem<String>(

                                    value:value,
                                    child: Padding(
                                      //Ma:const EdgeInsets.all(8.0),

                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        value,

                                        style:
                                        new TextStyle(color: Colors.black, fontSize: 13),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          new Expanded(
            child: new Row(
              children: <Widget>[
                Container(
                  padding: new EdgeInsets.all(0.0),
                  child: Column(
                    children: <Widget>[
                      new Container(
                        padding: new EdgeInsets.only(left:10, top: 8,right: 130),
                        child: Text(
                          'XYZ',
                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      new Padding(
                        padding:
                        new EdgeInsets.only(left: 10, right:5, top: 10, bottom: 10),
                        child: DropdownButtonHideUnderline(
                          child: Container(
                            height: 45,
                            width: 165,
                            //width: MediaQuery.of(context).size.width,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2.0,
                                  style: BorderStyle.solid,
                                  //#eceef0
                                  color: Color(hexColor('#f0f2f3')),
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                              ),
                            ),
                            child: DropdownButton<String>(
                              // pring(currentSelectedValue),
                              // hint: Text("Select Device"),
                              // itemHeight: 10,
                              underline: SizedBox(

                              ),
                              value: currentSelectedValue,
                              isDense: true,
                              // isExpanded: true,
                              icon: Container(
                                color: Colors.white,
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 32,
                                  color: Colors.blue,
                                ),
                              ),
                              hint: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Select",
                                  style: TextStyle(color: Colors.black, fontSize: 13),
                                ),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  currentSelectedValue = newValue;
                                });
                                print(currentSelectedValue);
                              },
                              items: deviceTypes.map(( String value) {
                                // print(value);

                                return DropdownMenuItem<String>(

                                  value:value,
                                  child: Padding(
                                    //Ma:const EdgeInsets.all(8.0),

                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      value,

                                      style:
                                      new TextStyle(color: Colors.black, fontSize: 13),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: new EdgeInsets.all(0.0),
                  child: Column(
                    children: <Widget>[
                      new Container(
                        padding: new EdgeInsets.only( top: 8,right: 130),
                        child: Text(
                          'XYZ',
                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      new Padding(
                        padding:
                        new EdgeInsets.only(left:2, right: 5, top: 10, bottom: 10),
                        child: DropdownButtonHideUnderline(
                          child: Container(
                            height: 45,
                            width: 165,
                            //width: MediaQuery.of(context).size.width,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2.0,
                                  style: BorderStyle.solid,
                                  //#eceef0
                                  color: Color(hexColor('#f0f2f3')),
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                              ),
                            ),
                            child: DropdownButton<String>(
                              // pring(currentSelectedValue),
                              // hint: Text("Select Device"),
                              // itemHeight: 10,
                              underline: SizedBox(

                              ),
                              value: currentSelectedValue,
                              isDense: true,
                              // isExpanded: true,
                              icon: Container(
                                color: Colors.white,
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 32,
                                  color: Colors.blue,
                                ),
                              ),
                              hint: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Select",
                                  style: TextStyle(color: Colors.black, fontSize: 13),
                                ),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  currentSelectedValue = newValue;
                                });
                                print(currentSelectedValue);
                              },
                              items: deviceTypes.map(( String value) {
                                // print(value);

                                return DropdownMenuItem<String>(

                                  value:value,
                                  child: Padding(
                                    //Ma:const EdgeInsets.all(8.0),

                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      value,

                                      style:
                                      new TextStyle(color: Colors.black, fontSize: 13),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          new Expanded(
            child: Container(
              height: 50,
              width: 180,
              child: new Column(
                children: <Widget>[
                  new Padding(
                      padding: new EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      child: FilledButton(text: "submit", fontSize: 18)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //-------------------------------Tab3-----------------------------------------//
  listDatatab3() {
    return Container(
      // height: 300,
      alignment: Alignment.center,
      child: new Column(
        children: <Widget>[
          new Padding(
            padding:
                new EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: new EdgeInsets.all(0.0),
                  child: Column(
                    children: <Widget>[
                      new Container(
                        padding: new EdgeInsets.only(left:5, top: 8,right: 300),
                        child: Text(
                          'XYZ',
                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      new Padding(
                        padding:EdgeInsets.only( top: 10, bottom: 10),
                        child: DropdownButtonHideUnderline(
                          child: Container(
                            height: 45,
                            width: 330,
                            //width: MediaQuery.of(context).size.width,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2.0,
                                  style: BorderStyle.solid,
                                  //#eceef0
                                  color: Color(hexColor('#f0f2f3')),
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                              ),
                            ),
                            child: DropdownButton<String>(
                              // pring(currentSelectedValue),
                              // hint: Text("Select Device"),
                              // itemHeight: 10,
                              underline: SizedBox(

                              ),
                              value: currentSelectedValue,
                              isDense: true,
                              // isExpanded: true,
                              icon: Container(
                                color: Colors.white,
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 32,
                                  color: Colors.blue,
                                ),
                              ),
                              hint: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Select",
                                  style: TextStyle(color: Colors.black, fontSize: 13),
                                ),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  currentSelectedValue = newValue;
                                });
                                print(currentSelectedValue);
                              },
                              items: deviceTypes.map(( String value) {
                                // print(value);

                                return DropdownMenuItem<String>(

                                  value:value,
                                  child: Padding(
                                    //Ma:const EdgeInsets.all(8.0),

                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      value,

                                      style:
                                      new TextStyle(color: Colors.black, fontSize: 13),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          Container(
              height: 50,
              width: 180,
              child: FilledButton(text: "submit", fontSize: 18))
//               new Padding(
//                  padding: EdgeInsets.all(20),
//                  child: FilledButton(text: "submit", fontSize: 18))
        ],
      ),
    );
  }

  //-------------------------------tabs method----------------------------------//

  tabs() {
    return Container(
      padding: new EdgeInsets.only(left: 5),
      child: Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.only( top: 8,right: 85),
            child: Text(
              'XYZ',
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ),
          new Padding(
            padding:
                new EdgeInsets.only(left: 0, right: 5, top: 10, bottom: 10),
            child: DropdownButtonHideUnderline(
              child: Container(
                height: 45,

                //width: MediaQuery.of(context).size.width,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2.0,
                      style: BorderStyle.solid,
                      //#eceef0
                      color: Color(hexColor('#f0f2f3')),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
                child: DropdownButton<String>(
                 // pring(currentSelectedValue),
                  // hint: Text("Select Device"),
                 // itemHeight: 10,
                  underline: SizedBox(

                  ),
                  value: currentSelectedValue,
                  isDense: true,
                  // isExpanded: true,
                  icon: Container(
                    color: Colors.white,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 32,
                      color: Colors.blue,
                    ),
                  ),
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "100",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      currentSelectedValue = newValue;
                    });
                    print(currentSelectedValue);
                  },
                  items: deviceTypes.map(( String value) {
                   // print(value);

                    return DropdownMenuItem<String>(

                      value:value,
                      child: Padding(
                        //Ma:const EdgeInsets.all(8.0),

                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                           value,

                          style:
                              new TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

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
              (Utils.getDeviceHeight(context) / 1.1)),
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




