import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:flutter/material.dart';

class ShippingScreen extends StatefulWidget {
  @override
  _ShippingScreenState createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.bgColor,
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return shippingCards();
          }
        ),
      ),
    );
  }

  //shipping card show the text and date
  shippingCards(){
    return InkResponse(
      onTap: () {
        orderDetailsScreenNavigator(context, 1);
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
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CommonView.rowCard(StringRes.orders, "#1003111124"),
            SizedBox(height: 1),
            CommonView.rowCard(StringRes.dayOrder, "30/05/20")
          ],
        )
      ),
    );
  }

}
