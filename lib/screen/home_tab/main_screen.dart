import 'package:ChaiChod/config/color_resources.dart';
import 'package:ChaiChod/config/util.dart';
import 'package:ChaiChod/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../export.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentScreenIndex = 0;
  List<Widget> _screens;

  List<List> _bottomData = <List>[
    [ 0, FontAwesomeIcons.home, 'หน้าหลัก' ],
    [ 1, FontAwesomeIcons.archive, 'ติดตามพัสดุ' ],
    [ 2, FontAwesomeIcons.bell, 'แจ้งเตือน' ],
    [ 3, FontAwesomeIcons.user, 'โปรไฟล์' ],
  ];

  @override
  void initState() {
    _screens = [
      HomeScrene(),
      ProductListScreen(),
      ProductListScreen(),
      ProductListScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.greyColor,
      child: Scaffold(
        backgroundColor: ColorRes.bgColor,
//        appBar: _appBar(),
        body: _screens[_currentScreenIndex],
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Container(
        height: 50,
          alignment: Alignment.topCenter,
          child: Image.asset(Utils.getAssetsImg('logo')),
      ),

      /*title: Image(
        image: AssetImage('assets/img/logo.png'),
        width: 110,
      ),*/

      leading: _currentScreenIndex != 0 ? IconButton(
          onPressed: () {
            print('Back');
          },
          padding: EdgeInsets.only(
            left: 10,
          ),
          icon: Icon(Icons.arrow_back),
          iconSize: 28,
          color: ColorRes.greyColor,
        ) : null,
      actions: <Widget>[
        IconButton(
          onPressed: () {
            print('Shopping Cart');
          },
          padding: EdgeInsets.only(
            right: 15,
          ),
          icon: Icon(Icons.shopping_basket),
          iconSize: 28,
          color: ColorRes.primaryColor,
        ),
      ],
    );
  }

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
                  fontFamily: 'Roboto',
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
