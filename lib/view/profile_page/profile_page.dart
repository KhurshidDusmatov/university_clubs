import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:univesity_clubs/controller/home/home_controller.dart';
import 'package:univesity_clubs/controller/main/main_controller.dart';
import 'package:univesity_clubs/controller/profile/home_controller.dart';
import 'package:univesity_clubs/data/storage/auth/auth_holder.dart';
import 'package:univesity_clubs/data/tools/const/res_colors.dart';
import 'package:univesity_clubs/data/tools/const/string.dart';
import 'package:univesity_clubs/data/tools/ext/string_ext.dart';
import 'package:univesity_clubs/view/widgets/custom_alert.dart';
import 'package:univesity_clubs/view/widgets/custom_button.dart';
import 'package:univesity_clubs/view/widgets/custom_button_blue_line.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isManager = Get.find<AuthHolder>().role == "MANAGER" ? true : false;
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: CircleAvatar(
                  radius: 56,
                  backgroundImage:
                      const AssetImage("assets/images/pr_default.png")),
            ),
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(Get.find<AuthHolder>().name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
            ),
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(Get.find<AuthHolder>().phone.formatUzbekPhoneNumber(),
                  style: TextStyle(
                      fontSize: 16,
                      color: ResColors.greyText,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ResColors.customRed),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(isManager ? "Rahbar" : "Talaba",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                ),
              ),
            ),
            SizedBox(height: 20),
            isManager
                ? Center(
                    child: Column(
                      children: [
                        CustomButton(
                          title: Strings.clubCreate,
                          color: ResColors.primaryColor,
                          func: () async {
                            // Get.to(() => const ShopPage(),
                            //     transition: Transition.rightToLeftWithFade,
                            //     duration: const Duration(milliseconds: 300));
                          },
                          height: 44,
                          width: 44,
                        ),
                        SizedBox(height: 16),
                        CustomButton(
                            title: Strings.applications,
                            color: ResColors.primaryColor,
                            func: () async {
                              /// Applications
                            },
                            height: 44,
                            width: 44),
                        SizedBox(height: 16),
                        CustomButton(
                            title: Strings.addEvent,
                            color: ResColors.primaryColor,
                            func: () async {
                              /// Add events
                            },
                            height: 44,
                            width: 44),
                        SizedBox(height: 16),
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      children: [
                        CustomButton(
                          title: Strings.myClubs,
                          color: ResColors.primaryColor,
                          func: () async {

                          },
                          height: 44,
                          width: 44,
                        ),
                        SizedBox(height: 16),
                        CustomButton(
                            title: Strings.events,
                            color: ResColors.primaryColor,
                            func: () async {

                            },
                            height: 44,
                            width: 44),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
            Center(
              child: CustomButtonBlueLine(
                  title: Strings.logout,
                  func: () async {
                    customAlertDialog(Strings.areYouSure, () async {
                      Get.find<MainController>().setFalse();
                      await Get.find<AuthHolder>().clearAuth();
                      Get.offAllNamed('/');
                      Get.find<HomeController>().update();
                    });
                  },
                  height: 44,
                  width: 44),
            )
          ]),
        );
      },
    );
  }
}
