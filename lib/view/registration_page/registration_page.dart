import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:univesity_clubs/controller/registration/registration_controller.dart';
import 'package:univesity_clubs/data/tools/const/res_colors.dart';
import 'package:univesity_clubs/data/tools/const/string.dart';
import 'package:univesity_clubs/view/widgets/custom_button.dart';
import 'package:univesity_clubs/view/widgets/custom_text_field.dart';
import 'package:univesity_clubs/view/widgets/white_app_bar.dart';

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
                  padding: EdgeInsets.only(left: 18),
                  child: Text(Strings.signUp,
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w700)),
                ),
                SizedBox(height: 24),
                CustomTextField(
                    hintText: Strings.enterName,
                    controller: controller.nameController,
                    keyboardType: TextInputType.text,
                    hasPrefixIcon: false,
                    maxLength: -1,
                    textNotValid: controller.emptyName),
                SizedBox(height: 12),
                CustomTextField(
                    hintText: Strings.mobileNumber.tr,
                    controller: controller.phoneNumberController,
                    keyboardType: TextInputType.number,
                    hasPrefixIcon: true,
                    maxLength: 16,
                    textNotValid: controller.phoneNotValid),
                SizedBox(height: MediaQuery.of(context).size.height/4.6),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: CustomButton(
                      title: Strings.signUp,
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
