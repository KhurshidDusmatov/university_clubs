import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:univesity_clubs/controller/add_club/add_club_controller.dart';
import 'package:univesity_clubs/controller/home/home_controller.dart';
import 'package:univesity_clubs/data/storage/auth/auth_holder.dart';
import 'package:univesity_clubs/data/tools/const/res_colors.dart';
import 'package:univesity_clubs/data/tools/const/string.dart';
import 'package:univesity_clubs/data/tools/ext/string_ext.dart';
import 'package:univesity_clubs/domain/data/club/club_model.dart';

class ClubInfo extends StatelessWidget {
  final ClubModel club;

  const ClubInfo({super.key, required this.club});

  @override
  Widget build(BuildContext context) {
    bool isManager = Get.find<AuthHolder>().role == "MANAGER" ? true : false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: ResColors.blackWithOpacity)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(club.title, style: TextStyle(fontSize: 20)),
              Text(club.description,
                  style: TextStyle(color: ResColors.greyText)),
              SizedBox(height: 6),
              Text(club.phone.toUzbFormat(),
                  style: TextStyle(color: ResColors.greyText)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  InkWell(
                    onTap: () {
                      if (Get.find<AuthHolder>().authToken.isNotEmpty) {
                        if (isManager) {
                          Get.find<AddClubController>().deleteClubById(club.id);
                        } else {
                          var homeController = Get.find<HomeController>();
                          bool isFollowing = homeController.myClubList
                              .any((c) => c.id == club.id);
                          if (isFollowing) {
                            Get.find<AddClubController>().unfollowToClub(club);
                          } else {
                            Get.find<AddClubController>().followToClub(club);
                          }
                        }
                      } else {
                        Get.snackbar(Strings.appName, Strings.youCantJoin);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: isManager
                            ? ResColors.emptyError
                            : ResColors.primaryColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 3),
                        child: GetBuilder<HomeController>(
                          builder: (controller) {
                            bool isFollowing = controller.myClubList
                                .any((c) => c.id == club.id);
                            return Text(
                              isManager
                                  ? Strings.delete
                                  : isFollowing
                                      ? Strings.cancel
                                      : Strings.join,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
