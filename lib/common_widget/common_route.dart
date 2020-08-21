import 'package:ChaiChod/screen/cart/cart_screen.dart';
import 'package:ChaiChod/screen/login/login_screen.dart';
import 'package:ChaiChod/screen/search_home/search_screen.dart';
import 'package:ChaiChod/screen/tab4_user/manage_profile/manage_profile_screen.dart';
import 'package:flutter/material.dart';

class Routes{

}

/*goToAddQue(context){
  showDialog(
    context: context,
    builder: (BuildContext context) => AddQuestionPage(),
  );
}*/

navigatorPop(BuildContext context) {
  Navigator.pop(context);
}

logInScreenNavigator(BuildContext context) {
//  Navigator.push(context, NavigatePageRoute(context, SoundBiteTrimPage(path, t,from: from, listImages:imageList)));
  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
}

cartScreenNavigator(BuildContext context) {
//  Navigator.push(context, NavigatePageRoute(context, SoundBiteTrimPage(path, t,from: from, listImages:imageList)));
  Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
}


searchScreenNavigator(BuildContext context) {
//  Navigator.push(context, NavigatePageRoute(context, SoundBiteTrimPage(path, t,from: from, listImages:imageList)));
  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
}

manageProfileScreenNavigator(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => ManageProfileScreen()));
}

