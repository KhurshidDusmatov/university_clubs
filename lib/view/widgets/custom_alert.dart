import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:univesity_clubs/data/tools/const/res_colors.dart';
import 'package:univesity_clubs/data/tools/const/string.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      backgroundColor: ResColors.backgroundColor,
      title: Strings.appName,
      titleStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      middleText: Strings.areYouSureToExit,
      middleTextStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      actions: [
        TextButton(
            onPressed: () {
              exit(0);
            },
            child: Text(Strings.yes,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(Strings.cancel,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
      ]);
  return Future.value(true);
}

Future<bool> customAlertDialog(String middleTitle, void Function() func) {
  Get.defaultDialog(
      backgroundColor: ResColors.backgroundColor,
      title: Strings.appName,
      titleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      middleText: middleTitle,
      middleTextStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      actions: [
        TextButton(
            onPressed: () {
              func();
            },
            child: Text(Strings.yes.tr,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(Strings.cancel.tr,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
      ]);
  return Future.value(true);
}
