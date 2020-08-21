import 'package:ChaiChod/config/color_resources.dart';
import 'package:flutter/material.dart';

class ShipmentScreen extends StatefulWidget {
  @override
  _ShipmentScreenState createState() => _ShipmentScreenState();
}

class _ShipmentScreenState extends State<ShipmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.lightWhite,

      body: Center(
        child: Text("Shipment"),
      ),
    );
  }
}
