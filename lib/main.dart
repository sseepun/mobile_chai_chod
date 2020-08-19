import 'package:ChaiChod/common_widget/common_route.dart';
import 'package:ChaiChod/config/string_resources.dart';
import 'package:ChaiChod/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'screen/home_tab/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chai Chod',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: StringRes.fontFamilyRoboto
      ),
      home: new LoginScreen(),
    );
  }
}
