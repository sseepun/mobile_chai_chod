import 'package:ChaiChod/screen/cart/cart_screen.dart';
import 'package:flutter/material.dart';

class Routes{

}

/*goToAddQue(context){
  showDialog(
    context: context,
    builder: (BuildContext context) => AddQuestionPage(),
  );
}*/


cartScreenNavigator(BuildContext context) {
//  Navigator.push(context, NavigatePageRoute(context, SoundBiteTrimPage(path, t,from: from, listImages:imageList)));
  Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
}