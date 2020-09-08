import 'package:ChaiChod/screen/tab4_user/set_up/child_setup/map_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:ChaiChod/export.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor pinLocationIcon;
  final LatLng _center = const LatLng(23.022505, 72.571365);
  void _onMapCreated(GoogleMapController controller) {
//    mapController = controller;
    _controller.complete(controller);
  }
  void initState() {
    super.initState();
  }

  // map are use in map in screen
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorRes.lightWhite,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CommonView.backArrowAndTitle(
                context, StringRes.address, ColorRes.blackColor),
            SizedBox(height: 20),
            searchData(),
            map(),
            //listData(),
          ],
        ),
      ),
    ));
  }

//  SingleChildScrollView(
//  child: Column(
//  children: <Widget>[
//  CommonView.backArrowAndTitle(
//  context, StringRes.address, ColorRes.blackColor),
//  SizedBox(height: 20),
//  searchData(),
//  map(),
//  //listData(),
//  ],
//  ),
//  ),

  //search field
  searchData() {
    return Container(
      height: 50,
      width: Utils.getDeviceWidth(context),
      margin: EdgeInsets.all(15),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search here...',
          filled: true,
          fillColor: ColorRes.whiteColor,
          border: UnderlineInputBorder(borderRadius: BorderRadius.circular(2)),
          prefixIcon: IconButton(
            icon: Icon(
              Icons.search,
              size: 20,
            ),
          ),
          hintStyle: TextStyle(
            fontFamily: 'Roboto',
            letterSpacing: 1.0,
            fontSize: 15,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(2)),
            borderSide: BorderSide(width: 1, color: ColorRes.greyColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(2)),
            borderSide: BorderSide(width: 1, color: ColorRes.greyColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: ColorRes.greyColor),
          ),
        ),
      ),
    );
  }
}
