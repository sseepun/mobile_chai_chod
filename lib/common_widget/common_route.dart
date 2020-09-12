import 'package:ChaiChod/screen/cart/cart_screen.dart';
import 'package:ChaiChod/screen/login/login_screen.dart';
import 'package:ChaiChod/screen/order_details/order_history/debit_card/debit_card_screen.dart';
import 'package:ChaiChod/screen/order_details/order_history/orderhistory.dart';
import 'package:ChaiChod/screen/order_details/order_history/payment_transfer/payment_success/payment_sccess_screen.dart';
import 'package:ChaiChod/screen/order_details/order_history/payment_transfer/payment_transfer_screen.dart';
import 'package:ChaiChod/screen/order_details/orderdetailscreen.dart';
import 'package:ChaiChod/screen/order_details/payment_billing/payment_billing_screen.dart';
import 'package:ChaiChod/screen/search_home/search_screen.dart';
import 'package:ChaiChod/screen/search_home/search_tabs_screen.dart';
import 'package:ChaiChod/screen/search_home/select_tire/select_tire_screen.dart';
import 'package:ChaiChod/screen/tab1_home/category/product/order_summary/service/shipping/delivery_address/location/loaction_search_screen/loaction_search_screen.dart';
import 'package:ChaiChod/screen/tab1_home/category/product/order_summary/service/shipping/delivery_address/location/location_screen.dart';
import 'package:ChaiChod/screen/tab1_home/category/product/product_screen.dart';
import 'package:ChaiChod/screen/tab2_archive/tab2_successfully/rate_product/complete/complete.dart';
import 'package:ChaiChod/screen/tab2_archive/tab2_successfully/rate_product/rate_product_screen.dart';
import 'package:ChaiChod/screen/tab3_notification/notification_screen.dart';
import 'package:ChaiChod/screen/tab3_notification/tab2_shipment/order/order_screen.dart';
import 'package:ChaiChod/screen/tab4_user/about_us/aboutus_screen.dart';
import 'package:ChaiChod/screen/tab4_user/favorites/favorites_screen.dart';
import 'package:ChaiChod/screen/tab4_user/manage_profile/manage_profile_screen.dart';
import 'package:ChaiChod/screen/tab4_user/set_up/setup_screen.dart';
import 'package:flutter/material.dart';
import '../screen/tab1_home/category/product/order_summary/order_summary_screen.dart';

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
rateProductScreenNavigator(BuildContext context, int i) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => RateProductScreen(i: i)));
}
orderHistoryScreenNavigator(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => OrderHistoryScreen()));
}
orderScreenNavigator(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => OrderScreen()));
}
orderSummaryScreenNavigator(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => OrderSummaryScreen()));
}
paymentTransferScreenNavigator(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => PaymentTransferScreen()));
}
paymentBillingScreenNavigator(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => PaymentBillingScreen()));
}
debitCardScreenNavigator(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => DebitCardScreen()));
}
completeScreenNavigator(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => CompleteScreen()));
}
paymentSuccessScreenNavigator(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => PaymentSuccessScreen()));
}

searchScreensNavigator(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => SearchTabsScreen()));
}
searchTabsScreenNavigator(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => SearchScreen()));
}
selectTireScreenNavigator(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => SelectTireScreen()));
}

productScreenNavigator(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ProductScreen()));
}

searchLocationNavigator(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => Search()));
}
