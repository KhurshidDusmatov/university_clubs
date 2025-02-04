import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:univesity_clubs/controller/login/login_controller.dart';
import 'package:univesity_clubs/data/tools/const/string.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(Get.find()),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 8),
                Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Text(Strings.signIn,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18, bottom: 7, top: 8),
                  child: Text(Strings.enterNumberPlz,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ),
                CustomTextField(
                    hintText: Strings.mobileNumber,
                    controller: controller.phoneController,
                    keyboardType: TextInputType.number,
                    hasPrefixIcon: true,
                    maxLength: 16,
                    textNotValid: controller.phoneNotValid),
                SizedBox(height: MediaQuery.of(context).size.height / 3.5),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: CustomButton(
                      title: Strings.signIn.tr,
                      color: ResColors.primaryColor,
                      func: () async {
                        await Future.delayed(const Duration(milliseconds: 500));
                        var appSignatureId = await SmsAutoFill().getAppSignature;
                        controller.signature = appSignatureId;
                        controller.login();
                      },
                      // context: context,
                      height: 48,
                      width: 34),
                ),
                SizedBox(height: 12.h),
                const BottomNavigation(),
              ],
            ),
          ),
        );
      },
    );
  }
}
