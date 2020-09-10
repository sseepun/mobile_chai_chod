import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/common_widget/common_widget.dart';
import 'package:ChaiChod/config/color_resources.dart';
import 'package:flutter/material.dart';

class AllNotificationScreen extends StatefulWidget {
  @override
  _AllNotificationScreenState createState() => _AllNotificationScreenState();
}

class _AllNotificationScreenState extends State<AllNotificationScreen> {

  List<String> stringList = [
    'เตรียมชำระเงินวางบิล',
    'กำลังจัดส่งสินค้าให้คุณ' ,
    'จัดส่งสำเร็จ', 
    'จัดส่งสำเร็จ', 
    'จัดส่งสำเร็จ'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.bgColor,
      body:  SingleChildScrollView(
        child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return notificationCards(index);
          }
        ),
      ),
    );
  }

  notificationCards(int index){
    return InkResponse(
      onTap: () {
        if(index == 0) {
          orderHistoryScreenNavigator(context);
        } else if(index == 1) {
          orderDetailsScreenNavigator(context, index);
        } else if(index == 2) {
          orderDetailsScreenNavigator(context, index);
        } else if(index == 3) {
          orderDetailsScreenNavigator(context, index);
        } else if(index == 4) {
          orderDetailsScreenNavigator(context, index);
        }
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CommonView.rowCardWithColor(
              stringList[index], "15 OOu.", statusColor(index)
            ),
            SizedBox(height: 1),
            CommonView.rowCardGrey("คำสั่งซื้อเลขที่ #9138123", ""),
          ],
        )
      ),
    );
  }

  //color show use in color changes
  statusColor(int index) {
    if(index == 0) {
      return Colors.pink;
    } else if(index == 1) {
      return Colors.orange;
    } else {
      return Colors.black;
    }
  }

}
