import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
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
          itemCount: 4,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return successFullCard();
          }
        ),
      ),
    );
  }

  //success full card in order , date order , date Of Receipt
  successFullCard() {
    return InkResponse(
      onTap: () {
        orderDetailsScreenNavigator(context, 2);
      },
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 10),
        padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0.5, 0.5),
              color: Colors.black12,
              blurRadius: 2,
            )
          ],
          color: ColorRes.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CommonView.rowCard(StringRes.orders, "#1003111124"),
            SizedBox(height: 1),
            CommonView.rowCard(StringRes.dateOrder, "30/05/20"),
            SizedBox(height: 1),
            CommonView.rowCard(StringRes.dateOfReceipt, "31/05/20")
          ],
        )
      ),
    );
  }

}
