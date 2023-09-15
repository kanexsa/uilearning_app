import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/app_colors.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    const Center(
      child: Text("Home"),
    ),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("Course"),
    ),
    const Center(
      child: Text("Chat"),
    ),
    const Center(
      child: Text("Profile"),
    ),
  ];

  return widget[index];
}

SizedBox iconSizedBox(String path, bool isActive) {
  return SizedBox(
    width: 15.w,
    height: 15.h,
    child: Image.asset(
      path,
      color: isActive
          ? AppColors.primaryElement
          : AppColors.primaryFourElementText,
    ),
  );
}

var bottomTabs = [
  BottomNavigationBarItem(
    label: "home",
    icon: iconSizedBox("assets/icons/home.png", false),
    activeIcon: iconSizedBox(
      "assets/icons/home.png",
      true,
    ),
  ),
  BottomNavigationBarItem(
    label: "search",
    icon: iconSizedBox(
      "assets/icons/search2.png",
      false,
    ),
    activeIcon: iconSizedBox("assets/icons/search2.png", true),
  ),
  BottomNavigationBarItem(
    label: "course",
    icon: iconSizedBox("assets/icons/play-circle1.png", false),
    activeIcon: iconSizedBox("assets/icons/play-circle1.png", true),
  ),
  BottomNavigationBarItem(
    label: "chat",
    icon: iconSizedBox("assets/icons/message-circle.png", false),
    activeIcon: iconSizedBox("assets/icons/message-circle.png", true),
  ),
  BottomNavigationBarItem(
    label: "profile",
    icon: iconSizedBox("assets/icons/person2.png", false),
    activeIcon: iconSizedBox("assets/icons/person2.png", true),
  ),
];
