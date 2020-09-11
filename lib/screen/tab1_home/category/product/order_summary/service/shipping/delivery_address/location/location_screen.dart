import 'package:flutter/cupertino.dart';
import 'package:ChaiChod/export.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'loaction_search_screen/loaction_search_screen.dart';

class LocationScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<LocationScreen> {
  GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor pinLocationIcon;
  final LatLng _center = const LatLng(23.022505, 72.571365);
  void _onMapCreated(GoogleMapController controller) {
    // mapController = controller;
    _controller.complete(controller);
  }
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: CommonView.appBarTitle(
            context, 'เลือกแผนที่จัดส่ง'
          ),
          backgroundColor: ColorRes.lightWhite,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                searchData(),
                map(),
              ],
            ),
          ),
        )
      ),
    );
  }

  //show map in screen
  map() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        zoomGesturesEnabled: true,
        tiltGesturesEnabled: true,
        scrollGesturesEnabled: true,
        rotateGesturesEnabled: true,
        myLocationEnabled: true,
        minMaxZoomPreference: MinMaxZoomPreference(6, 19),
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11,
          tilt: 59.440717697143555,
          bearing: 192.8334901395799,
        ),
      ),
    );
  }

  //search TextFormField
  searchData() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      color: Colors.transparent,
      child: TextField(
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Search()),
          );
        },
        style: TextStyle(
          fontSize: 16, 
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontFamily: StringRes.fontFamilyKanitBlack,
        ),
        decoration: InputDecoration(
          hintText: 'ค้นหาที่อยู่หรือชื่ออาคาร',
          filled: true,
          fillColor: ColorRes.whiteColor,
          contentPadding: EdgeInsets.all(0),
          prefixIcon: IconButton(
            icon: Icon(
              Icons.search,
              size: 28,
            ),
          ),
          hintStyle: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w500,
            fontFamily: StringRes.fontFamilyKanitBlack,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black26),
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: ColorRes.primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black26),
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
        ),
      ),
    );
  }

}
