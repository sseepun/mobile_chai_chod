import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/text.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:flutter/material.dart';

class ShipmentScreen extends StatefulWidget {
  @override
  _ShipmentScreenState createState() => _ShipmentScreenState();
}

class _ShipmentScreenState extends State<ShipmentScreen> {

  List<String> stringList = ['Prepare to pay,billing','Delivery of product to you..' ,'Successful delivery', 'Successful delivery', 'Successful delivery'];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorRes.lightWhite,
        child: SafeArea(
        bottom: false,
     child: Scaffold(
      backgroundColor: ColorRes.lightWhite,
      body:  SingleChildScrollView(
        child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return listData(index);
            }),
      ),
    ),),);
  }

  listData(int index){
    return InkResponse(
      onTap: () {
        if(index == 0) {
          orderScreenNavigator(context);
        } else if(index == 1) {
          orderDetailsScreenNavigator(context,index);
        } else if(index == 2) {
          orderDetailsScreenNavigator(context,index);
        }
        else if(index == 3) {
          orderDetailsScreenNavigator(context,index);

        }
        else if(index == 4) {
          orderDetailsScreenNavigator(context,index);

        }
      },

      child: Container(
//          height: MediaQuery.of(context).size.height * 0.17,
          height: 100,
          margin: EdgeInsets.only(left: 10, bottom: 10, right: 10),
          padding: EdgeInsets.only(left: 0, bottom: 0, right: 0, top: 10),

          decoration: new BoxDecoration(
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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,

            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(right: 0,left: 15),
                      child: AllText( stringList[index],
                        fontWeight: FontWeight.bold,
                        color: colorShow(index),
                        fontSize: 14,
                        maxLine: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top:10,left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child:
                            AllText(
                              "Order number #9138123",
                              color: Colors.black,
                              fontSize: 14,
                              maxLine: 1,
                              overflow: TextOverflow.ellipsis,
                              align: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: AllText(
                              "Order number #9138123",
                              color: Colors.black,
                              fontSize: 14,
                              maxLine: 1,
                              overflow: TextOverflow.ellipsis,
                              align: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: AllText(
                              "30/05/20",
                              color: Colors.black,
                              fontSize: 14,
                              maxLine: 1,
                              overflow: TextOverflow.ellipsis,
                              align: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: AllText(
                              "31/05/20",
                              color: Colors.black,
                              fontSize: 14,
                              maxLine: 1,
                              overflow: TextOverflow.ellipsis,
                              align: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ),
              ),
            ],
          )
      ),
    );
  }


  colorShow(int index) {
    if(index == 0) {
      return Colors.pink;
    } else if(index == 1) {
      return Colors.orange;
    } else {
      return ColorRes.blackColor;
    }
  }

}

