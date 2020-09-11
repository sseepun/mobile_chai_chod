import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/tab1_home/home_screen.dart';
import 'package:ChaiChod/screen/tab2_archive/archive_screen.dart';
import 'package:ChaiChod/screen/tab3_notification/notification_screen.dart';
import 'package:ChaiChod/screen/tab4_user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../export.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentScreenIndex = 0;
  List<Widget> _screens;
// list of bottom tab bar
  List<List> _bottomData = <List>[
    [ 0, FontAwesomeIcons.home, 'หน้าหลัก' ],
    [ 1, FontAwesomeIcons.archive, 'ติดตามพัสดุ' ],
    [ 2, FontAwesomeIcons.bell, 'แจ้งเตือน' ],
    [ 3, FontAwesomeIcons.user, 'โปรไฟล์' ],
  ];

  @override
  void initState() {
    // bottom tab bar screen
    _screens = [
      HomeScreen(),
      ArchiveScreen(),
      NotificationScreen(i: 1),
      UserScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.bgColor,
      child: Scaffold(
        backgroundColor: ColorRes.bgColor,
        body: _screens[_currentScreenIndex],
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  // bottom tab bar navigator and its use are bottom tab bar
  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentScreenIndex,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      backgroundColor: Colors.white,
      onTap: (int value) {
        setState(() {
          _currentScreenIndex = _bottomData[value][0];
        });
        print('Change current screen index to $_currentScreenIndex');
      },
      items: _bottomData.map((data) {
        var _bottomIndex = _bottomData.indexWhere((d) => d[0] == data[0]);
        return BottomNavigationBarItem(
          icon: Icon(
            data[1],
            size: 25,
            color: _bottomIndex == _currentScreenIndex 
              ? ColorRes.primaryColor
              : ColorRes.greyColor,
          ),
          title: Column(
            children: <Widget>[
              SizedBox(height: 4.0,),
              Text(
                data[2],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: _bottomIndex == _currentScreenIndex 
                    ? ColorRes.primaryColor
                    : ColorRes.greyColor,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

}
