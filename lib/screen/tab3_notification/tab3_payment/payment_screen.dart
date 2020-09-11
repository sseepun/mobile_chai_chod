import 'package:ChaiChod/config/color_resources.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorRes.lightWhite,
        child: SafeArea(
        bottom: false,
      child:Scaffold(
      backgroundColor: ColorRes.lightWhite,
      body: Center(
        child: Text("Payment"),
      ),
    ),),);
  }
}
