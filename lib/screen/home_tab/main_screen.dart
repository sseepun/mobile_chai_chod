import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../export.dart';

import '../tab1_home/home_screen.dart';
import '../tab2_archive/archive_screen.dart';
import '../tab3_notification/notification_screen.dart';
import '../tab4_user/user_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentScreenIndex = 0;
  List<Widget> _screens;
  List<List> _bottomData = <List> [
    [ 0, 'home', 'หน้าหลัก' ],
    [ 1, 'tracking', 'ติดตามพัสดุ' ],
    [ 2, 'notification', 'แจ้งเตือน' ],
    [ 3, 'user', 'โปรไฟล์' ],
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
      color: ColorRes.greyColor,
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
      elevation: 0,
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
        var activeIcon = 'home' + '-selected.png';
        var inactiveIcon = 'home' + '-unselected.png';

        String iconPath = 'home';
        if(data[0] == 1){
          iconPath = 'tracking';
        }else if(data[0] == 2){
          iconPath = 'notification';
        }else if(data[0] == 3){
          iconPath = 'user';
        }

        return BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 5),
            child: _bottomIndex == _currentScreenIndex
            ? CommonView.icon(iconPath+'-selected.png', 25, 25) 
            : CommonView.icon(iconPath+'-unselected.png', 25, 25)
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
