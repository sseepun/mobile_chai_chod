import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/filled_button.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'delivery_address/delivery_address_screen.dart';

class ShippingScreen extends StatefulWidget {
  @override
  _ShippingScreenState createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> with SingleTickerProviderStateMixin {
  
  final controller = PageController();
  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: CommonView.appBarTitleWithDesc(
            context, StringRes.shippingTitle, 
            StringRes.shippingTitle
          ),
          backgroundColor: ColorRes.whiteColor,
          body: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      addressSelection(),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: FilledButton(
                          onPressed: () { },
                          text: StringRes.continueText,
                          fontSize: 20,
                          height: 58,
                          isDisabled: 1,
                        ),
                      )
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

  addressSelection(){
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.fromLTRB(15, 10, 15, 8),
          child: Text(
            StringRes.shippingDescription1,
            style: AppTheme.subHeaderBoldStyle,
          ),
        ),
        InkResponse(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DeliveryAddressScreen()
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
                      StringRes.shippingDescription2,
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
    );
  }
  
}
