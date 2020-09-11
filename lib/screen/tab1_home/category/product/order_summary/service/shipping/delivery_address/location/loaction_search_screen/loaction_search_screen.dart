import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/app_theme.dart';
import 'package:flutter/material.dart';

import '../../location/location_screen.dart';

class Search extends StatefulWidget {
  final int i;
  const Search({Key key, this.i}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  List<String> stringList = [
    '999/9 นวมินทร์ บึงกลุ่ม กรุงเทพมหานคร รหัสไปรษณีย์ 10330',
    '123/1 เรวดี 29 ตลาดขวัญ เมืองนนทบุรี นนทบุรี รหัสไปรษณีย์ 11000',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SafeArea(
        child: Scaffold(
          appBar: CommonView.appBarTitleBlue(
            context, StringRes.SearchTitle1
          ),
          backgroundColor: ColorRes.bgColor,
          body: Center(
            child: ListView(
              children: <Widget>[
                Container(
                  height: 50,
                  color: Colors.blue,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 20, bottom: 5),
                          child: Text(
                            "ค้นหาที่อยู่หรือชื่ออาคาร",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 120, bottom: 5),
                          child: Icon(
                            Icons.cancel,
                            color: Colors.white,
                            size: 25,
                          )
                        ),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return addressGridData2(index);
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //list data are use in list of strings
  addressGridData2(int index) {
    return InkResponse(
      onTap: () {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LocationScreen()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LocationScreen()),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black12)
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              stringList[index],
              style: AppTheme.inputLabelBoldStyle,
            ),
          ],
        ),
      ),
    );
  }

}
