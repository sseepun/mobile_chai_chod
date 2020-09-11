import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/config/app_theme.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'location/location_screen.dart';

class DeliveryAddressScreen extends StatefulWidget {
  final int i;
  const DeliveryAddressScreen({Key key, this.i}) : super(key: key);
  @override
  _DeliveryAddressScreenState createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  final controller = PageController();
  List<String> stringList = [
    '999/9 นวมินทร์ บึงกลุ่ม กรุงเทพมหานคร รหัสไปรษณีย์ 10330',
    '123/1 เรวดี 29 ตลาดขวัญ เมืองนนทบุรี นนทบุรี รหัสไปรษณีย์ 11000',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.bgColor,
      child: SafeArea(
        child: Scaffold(
          appBar: CommonView.appBarTitleBg(
            context, StringRes.DeliveryAddressTitle
          ),
          backgroundColor: ColorRes.bgColor,
          body: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return addressGridData(index);
                      }),
                      
                      SizedBox(height: 40),
                      Column(
                        children: <Widget>[
                          InkResponse(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LocationScreen()),
                              );
                            },
                            child: Container(
                              height: 60,
                              margin: EdgeInsets.only(left: 15, right: 15),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(1, .5),
                                    color: Colors.black12,
                                    blurRadius: 5,
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(2)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        StringRes.DeliveryAddressDescription1,
                                        style: AppTheme.descGreyStyle,
                                      ),
                                    ),
                                    AppTheme.chevRightIcon
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]
                      ),
                      SizedBox(height: 20),

                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //list data are use in list of strings
  addressGridData(int index) {
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
        margin: EdgeInsets.only(top: 10, left: 15, right: 15),
        padding: EdgeInsets.fromLTRB(15, 15, 15, 20),
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              offset: Offset(0.5, 3),
              color: Colors.black12,
              blurRadius: 4,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'ที่อยู่ ${index+1}',
              style: AppTheme.inputLabelStyle,
            ),
            SizedBox(height: 5),
            Text(
              stringList[index],
              style: AppTheme.inputLabelStyle,
            ),
          ],
        ),
      ),
    );
  }

}
