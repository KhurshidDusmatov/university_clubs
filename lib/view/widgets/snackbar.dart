import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:univesity_clubs/data/tools/const/res_colors.dart';

void showSnackBar({required String text, Color? backgroundColor, Duration? duration  }){
  ScaffoldMessenger.of(Get.context!)
    ..hideCurrentSnackBar()
    ..showSnackBar(
        SnackBar(
            duration: duration?? const Duration(seconds: 2),
            backgroundColor: backgroundColor?? ResColors.primaryColor,
            content: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),
            ),
        )
    );
}