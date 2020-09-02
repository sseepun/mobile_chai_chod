import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/order_details/order_history/payment_transfer/payment_success/payment_sccess_screen.dart';
import 'package:ChaiChod/screen/success/success_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DebitCardScreen extends StatefulWidget {
  final int i;

  const DebitCardScreen({Key key, this.i}) : super(key: key);

  @override
  DebitCardScreenState createState() => DebitCardScreenState();
}

class DebitCardScreenState extends State<DebitCardScreen> {
  int isSelectedIndex = 0;
  bool isDealerDetails = false;
  bool isGeneralUser = false;

  @override
  void initState() {
    // TODO: implement initState
  }

  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorRes.whiteColor,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
//                  appBarDesign(),
                CommonView.backArrowAndTitle(
                    context, StringRes.DebitCardTitle, ColorRes.blackColor),
                orderIdDesign(),
                Divider(height: 1, color: ColorRes.greyColor),
                paymentDesign(),
                Divider(height: 1, color: ColorRes.greyColor),
                SizedBox(height: 10),
                barcode(),
                Divider(height: 1, color: ColorRes.greyColor),
                SizedBox(height: 10),
                payment(),
                SizedBox(height: 10),
                button(),
                SizedBox(height: 20),
                Visibility(
                  visible: isGeneralUser,
                  child: img(),
                ),
                submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  appBarDesign() {
    return Container(
      alignment: Alignment.center,
      height: 50,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: InkWell(
              child: Icon(Icons.arrow_back, size: 25),
              onTap: () {},
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  orderIdDesign() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 5, bottom: 10),
      color: Colors.white,
      child: Text('Order no.410031124 30/05/20'),
    );
  }

  paymentDesign() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AllText(
            "Summery to be paid",
            fontSize: 20,
            color: ColorRes.blackColor,
          ),
          SizedBox(height: 10),
          CommonView.productDetailsLeftRightData("ST", "B2,000"),
          SizedBox(height: 10),
          CommonView.productDetailsLeftRightData("Location section", "-"),
          SizedBox(height: 10),
          CommonView.productDetailsLeftRightData("Shipping cost", "B0"),
          SizedBox(height: 10),
          CommonView.productDetailsLeftRight1Data(
            "Amount to be paid",
            "B2,000",
            showColor: ColorRes.primaryColor,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
   barcode() {
    return Container(
        child:Image.asset(Utils.getAssetsImg('barcode'),),
    );
  }

  payment() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 10, top: 5, bottom: 10),
      color: Colors.white,
      child: Text(
        'Attach proof of payment',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  button() {
    return InkWell(
      onTap: () {
        setState(
          () {
            if (!isGeneralUser) {
              isGeneralUser = !isGeneralUser;
            } else {
              isDealerDetails = !isDealerDetails;
            }
          },
        );
      },
      child: Container(
        width: Utils.getDeviceWidth(context) / 2.0,
        height: 45,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: GestureDetector(
          child: Container(
            color: ColorRes.primaryColor,
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Container(
                  child: Text(
                    'RC A Upload',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  img() {
    return InkResponse(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 20),
            height: 45,
            width: 300,
            decoration: BoxDecoration(
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
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 5, right: 240),
                  child: Text('13.png',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                  width: 300,
                  height: 10,
                  decoration: new BoxDecoration(
                    color: isGeneralUser || isDealerDetails
                        ? ColorRes.primaryColor
                        : Color(hexColor('#E0E0E0')),
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: Icon(
              Icons.check_circle,
              size: 20,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  submitButton() {
    return InkResponse(
      onTap: () {
        if (isGeneralUser || isDealerDetails) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PaymentSuccessScreen()));
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 10),
        alignment: Alignment.center,
        width: Utils.getDeviceWidth(context),
        height: 45,
        decoration: new BoxDecoration(
          color: isGeneralUser || isDealerDetails
              ? ColorRes.primaryColor
              : Color(hexColor('#E0E0E0')),
          borderRadius: BorderRadius.all(Radius.circular(2)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
            ),
          ],
        ),
        child: AllText(
          "Complete",
          fontSize: 15,
          align: TextAlign.center,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  colorShow(int index) {
    if (index == 0) {
      return Colors.green;
    } else if (index == 1) {
      return Colors.deepPurple;
    } else {
      return ColorRes.blackColor;
    }
  }
}
