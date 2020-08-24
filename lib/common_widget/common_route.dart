import 'package:ChaiChod/screen/cart/cart_screen.dart';
import 'package:ChaiChod/screen/login/login_screen.dart';
import 'package:ChaiChod/screen/order_details/order_history/orderhistory.dart';
import 'package:ChaiChod/screen/order_details/orderdetailscreen.dart';
import 'package:ChaiChod/screen/search_home/search_screen.dart';
import 'package:ChaiChod/screen/tab3_notification/notification_screen.dart';
import 'package:ChaiChod/screen/tab4_user/about_us/aboutus_screen.dart';
import 'package:ChaiChod/screen/tab4_user/favorites/favorites_screen.dart';
import 'package:ChaiChod/screen/tab4_user/manage_profile/manage_profile_screen.dart';
import 'package:ChaiChod/screen/tab4_user/set_up/setup_screen.dart';
import 'package:flutter/material.dart';

class Routes {}

/*goToAddQue(context){
  showDialog(
    context: context,
    builder: (BuildContext context) => AddQuestionPage(),
  );
}*/

navigatorPop(BuildContext context) {
  Navigator.pop(context);
}

logInScreenNavigator(BuildContext context, int i) {
//  Navigator.push(context, NavigatePageRoute(context, SoundBiteTrimPage(path, t,from: from, listImages:imageList)));
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => LoginScreen(i: i)));
}

cartScreenNavigator(BuildContext context) {
//  Navigator.push(context, NavigatePageRoute(context, SoundBiteTrimPage(path, t,from: from, listImages:imageList)));
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => CartScreen()));
}

searchScreenNavigator(BuildContext context) {
//  Navigator.push(context, NavigatePageRoute(context, SoundBiteTrimPage(path, t,from: from, listImages:imageList)));
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => SearchScreen()));
}

manageProfileScreenNavigator(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ManageProfileScreen()));
}

favoriteScreenNavigator(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => FavoriteScreen()));
}

notificationScreenNavigator(BuildContext context, int i) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => NotificationScreen(i: 2)));
}

setUpScreenNavigator(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => SetUpScreen()));
}

aboutScreenNavigator(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => AboutUsScreen()));
}

orderDetailsScreenNavigator(BuildContext context, int i) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => OrderDetailsScreen(i: i)));
}

orderHistoryScreenNavigator(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => OrderHistoryScreen()));
}