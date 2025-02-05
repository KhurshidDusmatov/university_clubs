import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:univesity_clubs/data/tools/const/res_colors.dart';
import 'package:univesity_clubs/data/tools/const/string.dart';
import 'package:univesity_clubs/view/registration_page/registration_page.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Strings.askSignUp,
            style: TextStyle(
                color: ResColors.greyText,
                fontSize: 13,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(width: 8),
          InkWell(
            child: Text(
              Strings.signUp,
              style: TextStyle(
                color: ResColors.primaryColor,
                fontSize: 13.4,
                decoration: TextDecoration.underline,
                decorationColor: ResColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: (){
              Get.to(()=> const RegistrationPage(),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 300));
            },
          ),
        ],
      ),
    );
  }
}
