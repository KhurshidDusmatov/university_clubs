import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:univesity_clubs/controller/main/main_controller.dart';
import 'package:univesity_clubs/data/tools/const/res_colors.dart';
import 'package:univesity_clubs/data/tools/const/string.dart';
import 'package:univesity_clubs/view/widgets/custom_alert.dart';

import 'widgets/main_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        return Scaffold(
            extendBody: true,
            backgroundColor: Colors.white,
            body: WillPopScope(
                onWillPop: alertExitApp, child: controller.buildPage()),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(bottom: 16, left: 12, right: 12),
              child: Container(
                height: 62,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(11)),
                    boxShadow: [
                      BoxShadow(
                        color: ResColors.blackWithOpacity,
                        blurRadius: 1.2,
                        spreadRadius: 0.3,
                      )
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  child: BottomNavigationBar(
                    backgroundColor: ResColors.whiteColor,
                    elevation: 0,
                    onTap: (value) {
                      controller.setPageIndex(value);
                    },
                    currentIndex: controller.pageIndex,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: ResColors.primaryColor,
                    unselectedLabelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ResColors.lightGreyText,
                    ),
                    selectedLabelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: ResColors.primaryColor,
                    ),
                    items: [
                      item(
                        Strings.home,
                        "home_icon",
                      ),
                      item(
                        Strings.profile,
                        "profile_icon",
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
