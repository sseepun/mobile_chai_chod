import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/filled_button.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/app_theme.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/tab1_home/category/product/order_summary/service/shipping/shipping_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final controller = PageController();
  int _raioValue;

  bool isSelected = true;
  bool isDealerDetails = false;
  bool isGeneralUser = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: CommonView.appBarTitleWithDesc(
            context, StringRes.serviceTitle, 
            StringRes.serviceTitle1
          ),
          bottomNavigationBar: bottomBar(),
          backgroundColor: ColorRes.whiteColor,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 2),
                Visibility(
                  visible: true,
                  child: shippingServices(),
                ),
                Divider(height: 1, color: Colors.black26),
                dateSelection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bottomBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      decoration: BoxDecoration(
        color: ColorRes.whiteColor,
        border: Border(top: BorderSide(color: Colors.black12, width: 1.0))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CommonView.productDetailRow(StringRes.price, 'B2,000', false),
          CommonView.productDetailRow(StringRes.discount, 'B0', false),
          CommonView.productDetailRow(StringRes.shipping, 'B0', false),
          CommonView.productDetailRowLarge(StringRes.total, 'B2,000'),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: FilledButton(
              text: 'ดำเนินการต่อ', 
              fontSize: 20,
              height: 58,
              onPressed: (){
                // orderSummaryScreenNavigator(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  //service details are use in radio list tile and change color bottom button
  shippingServices() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(15, 10, 15, 8),
            child: Text(
              StringRes.serviceDes1,
              style: AppTheme.subHeaderBoldStyle,
            ),
          ),
          InkResponse(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShippingScreen()
                ),
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
                        StringRes.serviceDes2,
                        style: AppTheme.descGreyStyle,
                      ),
                    ),
                    AppTheme.chevRightIcon
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 25),
            child: Column(
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Radio(
                      value: 1, 
                      groupValue: _raioValue, 
                      activeColor: ColorRes.primaryColor,
                      onChanged: (val) {
                        setState(() {
                          _raioValue = val;
                        });
                      }
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget> [
                            Text(
                              'ติดตั้งฟรี (ในเขตบริการ)',
                              style: AppTheme.inputLabelBoldStyle,
                            ),
                            Text(
                              'กรุงเทพมหานคร, สมุทรปราการ, ปทุมธานี, นนบุรี, นครปฐม และสมุทรสาคร',
                              style: AppTheme.descGreySmallStyle,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Radio(
                      value: 2, 
                      groupValue: _raioValue, 
                      activeColor: ColorRes.primaryColor,
                      onChanged: (val) {
                        setState(() {
                          _raioValue = val;
                        });
                      }
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget> [
                            Text(
                              'ขนส่งเอกชนฟรี (ไม่ติดตั้ง)',
                              style: AppTheme.inputLabelBoldStyle,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Radio(
                      value: 3, 
                      groupValue: _raioValue, 
                      activeColor: ColorRes.primaryColor,
                      onChanged: (val) {
                        setState(() {
                          _raioValue = val;
                        });
                      }
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget> [
                            Text(
                              'จัดส่งนอกเขตบริการ (ติดตั้งฟรี)',
                              style: AppTheme.inputLabelBoldStyle,
                            ),
                            Text(
                              '* มีค่าบริการขนส่ง',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.red
                              )
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )

              ],
            ),
          ),
        ],
      )
    );
  }

  dateSelection(){
    return Container(
      padding: EdgeInsets.fromLTRB(15, 12, 15, 20),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              StringRes.serviceDescription,
              style: AppTheme.subHeaderSmallStyle,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: dateTextField(),
                ),
                Container(
                  height: 50,
                  width: 68,
                  padding: EdgeInsets.only(left: 8),
                  child: FlatButton(
                    color: ColorRes.primaryColor,
                    child: Icon(
                      Icons.calendar_today,
                      color: ColorRes.whiteColor,
                    ),
                    onPressed: () { },
                  )
                ),
              ],
            ),
          ),
        ],
      )
    );
  }

  dateTextField(){
    return TextField(
      style: TextStyle(
        fontSize: 15, 
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontFamily: StringRes.fontFamilyKanitBlack,
      ),
      decoration: InputDecoration(
        hintText: StringRes.discountServiceBtn1,
        filled: true,
        fillColor: ColorRes.whiteColor,
        contentPadding: EdgeInsets.only(left: 10, right: 10),
        hintStyle: TextStyle(
          fontSize: 15,
          color: Colors.black38,
          fontWeight: FontWeight.w400,
          fontFamily: StringRes.fontFamilyKanitBlack,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black26),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorRes.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black26),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
      ),
    );
  }

}
