import 'package:bormi/controller/verification_controller/verification_controller.dart';
import 'package:bormi/data/tools/strings/string.dart';
import 'package:bormi/data/tools/styles/res_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ResentText extends StatelessWidget {
  final VerificationController controller;

  const ResentText({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return !controller.timerFinished
        ? Center(
            child:
                // Text('${Strings.afterSecond.tr} ${controller.resendTime} second(s)',
                // style: theme.titleLarge,),)
                Countdown(
              seconds: 120,
              build: (context, double time) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${Strings.resendCode.tr}:",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "${time.round()}",
                      style: TextStyle(
                        color: ResColors.primaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                );
              },
              interval: const Duration(seconds: 1),
              onFinished: () {
                controller.timerFinished = true;
                controller.update();
                // controller.stopTimer();
              },
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.resendCode.tr,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 6.w,
              ),
              InkWell(
                onTap: () {
                  controller.invalidCode = false;
                  controller.startTimer();
                  controller.resendSms();
                },
                child: Text(
                  Strings.sending.tr,
                  style: TextStyle(
                    color: ResColors.primaryColor,
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline,
                    decorationColor: ResColors.primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          );
  }
}
