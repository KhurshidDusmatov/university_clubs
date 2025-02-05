import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:univesity_clubs/data/tools/const/res_colors.dart';

BottomNavigationBarItem item(String label, String icon) {
  return BottomNavigationBarItem(
      label: label,
      icon: SvgPicture.asset(
        'assets/icons/$icon.svg',
        color: ResColors.lightGreyText,
        height: 23,
        width: 23,
      ),
      activeIcon: SvgPicture.asset(
        color: ResColors.primaryColor,
        'assets/icons/$icon.svg',
        height: 25,
        width: 25,
      ));
}
