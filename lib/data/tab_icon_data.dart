import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.title = '',
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
  });

  String imagePath;
  String selectedImagePath; 
  bool isSelected;
  int index;
  String title;
  AnimationController animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/material/home-unselect.png',
      selectedImagePath: 'assets/material/home-select.png',
      index: 0,
      title: 'หน้าหลัก',
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/material/docmenu-unselect.png',
      selectedImagePath: 'assets/material/docmenu-select.png',
      index: 1,
      title: 'ถามหมอ',
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/material/noti-unselect.png',
      selectedImagePath: 'assets/material/noti-select.png',
      index: 2,
      title: 'แจ้งเตือน',
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/material/profile-unselect.png',
      selectedImagePath: 'assets/material/profile-select.png',
      index: 3,
      title: 'โปรไฟล์',
      isSelected: false,
      animationController: null,
    ),
  ];
}
