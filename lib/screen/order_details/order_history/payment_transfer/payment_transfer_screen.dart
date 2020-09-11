import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/order_details/order_history/payment_transfer/payment_success/payment_sccess_screen.dart';
import 'package:ChaiChod/screen/success/success_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Model class
class Model {
  String name;
  String image;
  String name1;
  String company;
  Model(this.image, this.name, this.name1, this.company);
}

class PaymentTransferScreen extends StatefulWidget {
  final int i;
  const PaymentTransferScreen({Key key, this.i}) : super(key: key);

  @override
  PaymentTransferScreenState createState() => PaymentTransferScreenState();
}

class PaymentTransferScreenState extends State<PaymentTransferScreen> {
  List<Model> list = List();
  int isSelectedIndex = 0;
  // isDealerDetails and isGeneralUser are use in button color change
  bool isDealerDetails = false;
  bool isGeneralUser = false;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      //list of image ,Description ,Number ,and company name
      list.add(Model(
        Utils.getAssetsImg('i1'),
        "Kasikorn Thai",
        "123 1 45567",
        "Chaichod Co.LTD",
      ));
      list.add(Model(
        Utils.getAssetsImg('i2'),
        "In Yapanit",
        "123 1 45567",
        "Chaichod Co.LTD",
      ));
    });
  }

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
        bottom: false,
        child: Scaffold(
          backgroundColor: ColorRes.whiteColor,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Heading back arrow and title
                CommonView.backArrowAndTitle(context, StringRes.paymentTitle, ColorRes.blackColor),

                orderIdDesign(),
                Divider(height: 1, color: ColorRes.greyColor),

                paymentDesign(),
                Divider(height: 1, color: ColorRes.greyColor),
                SizedBox(height: 10),

                title1(),

                title2(),

                ListView.builder(
                    itemCount: list.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return languageData(index);
                    }),
                SizedBox(height: 10),

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

  //Payment transfer screen in order id title
  orderIdDesign() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 5, bottom: 10),
      color: Colors.white,
      child: Text('Order no.410031124 30/05/20'),
    );
  }

  //Payment transfer screen in payment Design and product details , price
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
            fontSize: 20,
            color: ColorRes.blackColor,
          ),
          SizedBox(height: 10),
          CommonView.productDetailsLeftRightData("Price", "B2,000"),
          SizedBox(height: 10),
          CommonView.productDetailsLeftRightData("Discount", "B0"),
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

  //Payment transfer screen in title 1
  title1() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 10, top: 5, bottom: 10),
      color: Colors.white,
      child: Text(
        'Payment Notification',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  //Payment transfer screen in title 2
  title2() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 10, top: 5, bottom: 10),
      color: Colors.white,
      child: Text(
        'Select the payment bank',
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  //Payment transfer screen in card in image , company name , name design
  Widget languageData(int index) {
    return InkResponse(
      onTap: () {
        isSelectedIndex = index;
        setState(() {});
      },
      child: Container(
        height: 80,
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
        padding: EdgeInsets.only(left: 10, right: 10),
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Row(children: <Widget>[
          Image.asset(
            list[index].image,
            height: 50,
            width: 50,
            fit: BoxFit.fill,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        list[index].name,
                        style: TextStyle(
                          color: colorShow(index),
                        ),
                      ),
                      Text(
                        list[index].name1,
                        style: TextStyle(
                          color: ColorRes.primaryColor,
                        ),
                      ),
                      Text(
                        list[index].company,
                        style: TextStyle(
                          color: ColorRes.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
                isSelectedIndex == index
                    ? Container(
                        child: CircleAvatar(
                        backgroundColor: ColorRes.primaryColor,
                        radius: 15,
                        child: Icon(
                          Icons.check,
                          size: 20,
                          color: ColorRes.whiteColor,
                        ),
                      ))
                    : Container(),
              ],
            ),
          )
        ]),
      ),
    );
  }

  //Payment transfer screen in Attach proof of payment title
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

  //Payment transfer screen in RC A Upload button and its use the click this button and change color in submit button color
  button() {
    return InkWell(
      onTap: () {
        setState(() {
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
            color:ColorRes.primaryColor,
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left:20,right: 10),
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Container(
                  child: Text('RC A Upload',style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  //this image are show the button click
  img() {
    return InkResponse(
      child:Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10,right: 20),
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
               margin: EdgeInsets.only( top:5,right: 240),
               child: Text('13.png',style:TextStyle(color: Colors.black,)),
             ),
             Container(
               margin: EdgeInsets.only(left: 10, right:10 , top: 5 ),
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
            margin: EdgeInsets.only(top:10 ,),
            child: Icon(Icons.check_circle,size:20,color: Colors.green,),
          ),
        ],
      ),
    );
  }

  //submit button name is Complete and this button color change and this button are click then next screen move
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

 // color show are use in color change in index
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
