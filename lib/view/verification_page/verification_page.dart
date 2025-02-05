import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:univesity_clubs/controller/verification/verification_controller.dart';
import 'package:univesity_clubs/data/tools/const/string.dart';
import 'package:univesity_clubs/view/verification_page/widgets/resent_text.dart';
import 'package:univesity_clubs/view/widgets/custom_button.dart';
import 'package:univesity_clubs/view/widgets/white_app_bar.dart';
import '../../data/tools/const/res_colors.dart';

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
                  SizedBox(height: 28),
                  Padding(
                    padding: EdgeInsets.only(left: 18, right: 18),
                    child: Text(
                      Strings.verification,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                    controller.invalidCode ? Strings.invalidCode : '',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  ResentText(controller: controller),
                  SizedBox(height: MediaQuery.of(context).size.height / 4.3),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: CustomButton(
                        title: Strings.save,
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
