import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/filled_button.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'orderhistorymodel.dart';

class OrderHistoryScreen extends StatefulWidget {
  @override
  OrderHistoryScreenState createState() => OrderHistoryScreenState();
}

class OrderHistoryScreenState extends State<OrderHistoryScreen> {
  OrderHistoryModel model;
  int quant = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = OrderHistoryModel();
  }

  int _radioItem = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: ColorRes.whiteColor,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
//                  appBarDesign(),
                // Heading back arrow and title
                CommonView.backArrowAndTitle(
                    context, StringRes.orderHistory, ColorRes.blackColor),

                // all method are call
                orderIdDesign(),
                statusView(),
                productDetailsList(),
                paymentDesign(),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: FilledButton(
                    text: StringRes.continueText,
                    fontSize: 18,
                    onPressed: () {
                      bottomSheet(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

/*
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
*/

  //order history screen is used to order id
  orderIdDesign() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 5, bottom: 10),
      color: Colors.white,
      child: Text('#111111112222 30/05/2020'),
    );
  }

  // payment design are use product details and price
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
            "Summery",
            fontSize: 17,
            color: ColorRes.blackColor,
          ),
          SizedBox(height: 10),
          AllText(model.payment, color: ColorRes.blackColor),
          SizedBox(height: 5),
          AllText('Laid off. (credit to 30 days)',
              align: TextAlign.end, color: ColorRes.blackColor),
          SizedBox(height: 10),
          CommonView.productDetailsLeftRightData(model.price, "B2,000"),
          SizedBox(height: 5),
          CommonView.productDetailsLeftRightData(model.section, "Section AA"),
          SizedBox(height: 5),
          CommonView.productDetailsLeftRightData(model.shipping, "B50"),
          SizedBox(height: 5),
          CommonView.productDetailsLeftRightData(model.total, "B2,050"),
          SizedBox(height: 10),
        ],
      ),
    );
  }

 // status view use are order history screen in status, and date show
  statusView() {
    return Container(
      height: 100,
      color: ColorRes.lightWhite,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CommonView.productDetailsLeftRightData(model.status, "Are shopping",
              showColor: ColorRes.lightGreenTxt),
          CommonView.productDetailsLeftRightData(model.dorg, "30/05/2020"),
          CommonView.productDetailsLeftRightData(model.due, "30/06/2020",
              showColor: ColorRes.lightRedTxt),
        ],
      ),
    );
  }

  //product details list are use in list view builder and this list are build list child
  productDetailsList() {
    return Container(
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            return buildListChild(index);
          }),
    );
  }

  // build list child are using text ,image, number count, price details
  buildListChild(int index) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      margin: EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          AllText('NANKA AS 2+ - 205/5RR/A', color: ColorRes.blackColor),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(20),
                  width: Utils.getDeviceWidth(context) / 3.3,
                  child: Image.asset(Utils.getAssetsImg('tiers'),
                      fit: BoxFit.fill)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CommonView.productDetailsLeftRightData(
                        model.brand, "Micheline"),
                    CommonView.productDetailsLeftRightData(
                        model.pageWidth, "199mm"),
                    CommonView.productDetailsLeftRightData(
                        model.seriesNumber, "Fifty Five"),
                    CommonView.productDetailsLeftRightData(
                        model.edgeRubber, "Fifteen"),
                    CommonView.productDetailsLeftRightData(
                        model.sidewall, "10.72 cm"),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        height: 1,
                        color: ColorRes.greyColor,
                      ),
                    ),
                    Row(
//      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 10),
                              child: AllText(model.quantity,
                                  maxLine: 1,
                                  align: TextAlign.left,
                                  color: ColorRes.blackColor),
                            )),
                        Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                InkResponse(
                                  onTap: () {
                                    if (quant > 1) {
                                      quant -= 1;
                                      setState(() {});
                                    }
                                  },
                                  child: AllText(
                                    "-",
                                    fontSize: 25,
                                    color: quant > 1
                                        ? ColorRes.primaryColor
                                        : ColorRes.greyColor,
                                  ),
                                ),
                                AllText(
                                  "$quant",
                                  fontSize: 18,
                                  color: ColorRes.blackColor,
                                ),
                                InkResponse(
                                  onTap: () {
                                    quant += 1;
                                    setState(() {});
                                  },
                                  child: AllText("+", fontSize: 20),
                                ),
                              ],
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  //bottom sheet is using bottom sheet are selectPaymentChannel ,selectRadioPayment ,continueBtn method call
  void bottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.85,
              child: new Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 2.0,
                      width: 40,
                      color: Colors.blue),
                  selectPaymentChannel(),
                  selectRadioPayment(setState),
                  Spacer(),
                  continueBtn(),
                ],
              ),
            );
          });
        });
  }

  //select payment channel are using paymentChannel
  selectPaymentChannel() {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 30, bottom: 10),
      alignment: Alignment.topLeft,
      child: Text(
        StringRes.paymentChannel,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }

  // continue button are use in radio button are select then the next screen show
  continueBtn() {
    return Container(
      color: ColorRes.primaryColor,
      height: 50,
      margin: EdgeInsets.only(left: 5, right: 5,bottom: 10),
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        onPressed: () {
          if (_radioItem == 0) {
            paymentTransferScreenNavigator(context);
          } else if (_radioItem == 1) {
            debitCardScreenNavigator(context);
          } else if (_radioItem == 2) {
            orderHistoryScreenNavigator(context);
          } else if (_radioItem == 3) {
            paymentBillingScreenNavigator(context);
          }
        },
        child: Text(
          StringRes.continueText,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  //select radio payment are using radio list title list
  selectRadioPayment(setState) {
    return Column(
      children: <Widget>[
        RadioListTile(
          groupValue: _radioItem,
          title: Text(
            'Payment through bank account',
            style: TextStyle(fontSize: 14),
          ),
          value: 0,
          onChanged: (value) {
            setState(() {
              _radioItem = 0;
            });
          },
        ),
        RadioListTile(
          groupValue: _radioItem,
          title: Text(
            'Debit Card',
            style: TextStyle(fontSize: 14),
          ),
          value: 1,
          onChanged: (value) {
            setState(() {
              _radioItem = 1;
            });
          },
        ),
        RadioListTile(
          groupValue: _radioItem,
          title: Text(
            'Credit Card',
            style: TextStyle(fontSize: 14),
          ),
          value: 2,
          onChanged: (value) {
            setState(() {
              _radioItem = 2;
            });
          },
        ),
        RadioListTile(
          groupValue: _radioItem,
          title: Text(
            'Laid off:(credit to 30 days)',
            style: TextStyle(fontSize: 14),
          ),
          value: 3,
          onChanged: (value) {
            setState(() {
              _radioItem = 3;
            });
          },
        ),
      ],
    );
  }

//  commonContainer(String model, String s) {
//    return Container(
//      margin: EdgeInsets.only(top: 7, bottom: 7),
//      child: Row(
//        children: <Widget>[
//          Expanded(
//            child: Container(
//              child: Text(model),
//            ),
//          ),
//          Expanded(
//            child: Container(
//              margin: EdgeInsets.only(right: 10),
//              child:
//              Text(s, textAlign: TextAlign.end),
//            ),
//          ),
//        ],
//      ),
//    );
//  }

}
