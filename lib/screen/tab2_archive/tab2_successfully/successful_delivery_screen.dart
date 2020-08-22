import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:flutter/material.dart';

class SuccessfulDeliveryScreen extends StatefulWidget {
  @override
  _SuccessfulDeliveryScreenState createState() =>
      _SuccessfulDeliveryScreenState();
}

class _SuccessfulDeliveryScreenState extends State<SuccessfulDeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.lightWhite,
      body: SingleChildScrollView(
        child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return successFullCard();
            }),
      ),
    );
  }

  successFullCard() {
    return InkResponse(
      onTap: () {
        orderDetailsScreenNavigator(context, 2);
      },
      child: Container(
          height: 90,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                  offset: Offset(0.5, 0.5),
                  color: ColorRes.greyColor,
                  blurRadius: 0.5)
            ],
            color: ColorRes.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              cardTextShow(StringRes.orders, "#1003111124"),
              cardTextShow(StringRes.dateOrder, "30/05/20"),
              cardTextShow(StringRes.dateOfReceipt, "31/05/20")

            ],
          )),
    );
  }

  cardTextShow(String leftText, String rightText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(top: 0, left: 20),
            child: AllText(leftText,
              color: Colors.black,
              fontSize: 14,
              overflow: TextOverflow.ellipsis,
              maxLine: 1,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(top: 0, right: 15),
            child: AllText(
              rightText,
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }


}
