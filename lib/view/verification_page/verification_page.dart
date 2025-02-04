import 'package:bormi/controller/verification_controller/verification_controller.dart';
import 'package:bormi/data/tools/strings/string.dart';
import 'package:bormi/view/pages/auth/verification/widgets/resent_text.dart';
import 'package:bormi/view/pages/profile/profile_edit/widgets/white_app_bar.dart';
import 'package:bormi/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../../data/tools/styles/res_colors.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: VerificationController(Get.find(), Get.find()),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: const WhiteAppBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 28.h),
                  Padding(
                    padding: EdgeInsets.only(left: 18.w, right: 18.w),
                    child: Text(
                      Strings.verification.tr,
                      style: TextStyle(
                          fontSize: 30.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: PinFieldAutoFill(
                        decoration: BoxLooseDecoration(
                          strokeColorBuilder: PinListenColorBuilder(
                              Colors.black, Colors.black26),
                          bgColorBuilder: const FixedColorBuilder(Colors.white),
                          strokeWidth: 1.2,
                        ),
                        currentCode: controller.smsCode.value,
                        codeLength: 5,
                        onCodeChanged: (code) {
                          // setState(() {
                          //   codeValue=code.toString();
                          // });
                          if (code != null) {
                            controller.setSmsCode(code);
                          }
                        },
                        onCodeSubmitted: (val) {},
                      ),
                    ),
                  ),
                  Text(
                    controller.invalidCode ? Strings.invalidCode.tr : '',
                    style: TextStyle(fontSize: 20.sp, color: Colors.red),
                  ),
                  ResentText(controller: controller),
                  SizedBox(height: MediaQuery.of(context).size.height / 4.3),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: CustomButton(
                        title: Strings.save.tr,
                        color: ResColors.primaryColor,
                        func: () async {
                          controller.verification();
                        },
                        height: 48,
                        width: 34),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
