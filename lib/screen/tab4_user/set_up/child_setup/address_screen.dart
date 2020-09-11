import 'package:ChaiChod/screen/tab4_user/set_up/child_setup/map_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:ChaiChod/export.dart';


class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {


  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorRes.lightWhite,
        child: SafeArea(
        bottom: false,
      child: Scaffold(
        backgroundColor: ColorRes.lightWhite,
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorRes.primaryColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MapScreen()),
            );
 },
          child: Icon(Icons.add,size: 40,),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CommonView.backArrowAndTitle(context, StringRes.address, ColorRes.blackColor),
              SizedBox(height: 20),
              listData(),
            ],
          ),
        ),
      ),
        ), );
  }

  textTitle() {
    return Container(
        child: Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10),
          child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.arrow_back,
                size: 25,
                color: Colors.black,
              )),
        ),
        Container(
          padding: EdgeInsets.only(left: 120),
          child: AllText(
            StringRes.setUp,
            color: ColorRes.blackColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ));
  }

  //list of address
  listData() {
    return Container(
        margin: EdgeInsets.only(left: 10, bottom: 10, right: 10),
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              offset: Offset(0.5, 0.5),
              color: ColorRes.greyColor,
              blurRadius: 0.5,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 220),
                  child: AllText(
                   "Current Address",
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 50, bottom: 15),
                  child: AllText(
                    "999/9 Naawamin, Bueng Kum, Bangkok, 10330",
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}


