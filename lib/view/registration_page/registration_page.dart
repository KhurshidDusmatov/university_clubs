import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
      init: RegistrationController(Get.find()),
      builder: (controller) {
        return Scaffold(
          appBar: const WhiteAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/8),
                Padding(
                  padding: EdgeInsets.only(left: 18.w),
                  child: Text(Strings.signUp.tr,
                      style: TextStyle(
                          fontSize: 30.sp, fontWeight: FontWeight.w700)),
                ),
                SizedBox(height: 24.h),
                CustomTextField(
                    hintText: Strings.enterName.tr,
                    controller: controller.nameController,
                    keyboardType: TextInputType.text,
                    hasPrefixIcon: false,
                    maxLength: -1,
                    textNotValid: controller.emptyName),
                SizedBox(height: 12.h),
                CustomTextField(
                    hintText: Strings.mobileNumber.tr,
                    controller: controller.phoneNumberController,
                    keyboardType: TextInputType.number,
                    hasPrefixIcon: true,
                    maxLength: 16,
                    textNotValid: controller.phoneNotValid),
                SizedBox(height: MediaQuery.of(context).size.height/4.6),
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: CustomButton(
                      title: Strings.signUp.tr,
                      color: ResColors.primaryColor,
                      func: () async {
                        var appSignatureId=await SmsAutoFill().getAppSignature;
                        controller.signature=appSignatureId;
                         await controller.registration();
                      },
                      height: 48,
                      width: 34),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
