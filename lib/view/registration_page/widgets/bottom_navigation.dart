import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Strings.askSignUp.tr,
            style: TextStyle(
                color: ResColors.greyText,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(width: 8.w),
          InkWell(
            child: Text(
              Strings.signUp.tr,
              style: TextStyle(
                color: ResColors.primaryColor,
                fontSize: 13.4.sp,
                decoration: TextDecoration.underline,
                decorationColor: ResColors.primaryColor,
                fontWeight: FontWeight.w400,
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
