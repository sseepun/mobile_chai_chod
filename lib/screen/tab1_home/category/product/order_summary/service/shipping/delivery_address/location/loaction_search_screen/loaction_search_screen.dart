import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final int i;
  const Search({Key key, this.i}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: ListView(
          children: <Widget>[
            //heading
            Container(
              color: Colors.blue,

              child:CommonView.backArrowAndTitle(
                  context, StringRes.SearchTitle1, ColorRes.whiteColor),
            ),
            Container(
              height: 40,
              color: Colors.blue,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20,bottom: 5),
                      child: Text("Location",style: TextStyle(color: Colors.white,fontSize: 17),),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 120,bottom: 5),
                        child: Icon(Icons.cancel,color: Colors.white,size: 25,)
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30,left: 20, right: 20,bottom: 20),
              child: Text("999/9 Rama I Rd, Pathum Wan, Pathum Wan District, Bangkok 10330",style: TextStyle(fontWeight:
              FontWeight.bold),),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Container(
              margin: EdgeInsets.only(top: 20,left: 20, right: 20,bottom: 20),
              child: Text("999/9 Rama I Rd, Pathum Wan, Pathum Wan District, Bangkok 10330",style: TextStyle(fontWeight:
              FontWeight.bold),),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Container(
              margin: EdgeInsets.only(top: 20,left: 20, right: 20,bottom: 20),
              child: Text("999/9 Rama I Rd, Pathum Wan, Pathum Wan District, Bangkok 10330",style: TextStyle(fontWeight:
              FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
