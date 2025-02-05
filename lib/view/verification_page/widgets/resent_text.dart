import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:univesity_clubs/controller/verification/verification_controller.dart';
import 'package:univesity_clubs/data/tools/const/res_colors.dart';
import 'package:univesity_clubs/data/tools/const/string.dart';

class ResentText extends StatelessWidget {
  final VerificationController controller;

  const ResentText({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return !controller.timerFinished
        ? Center(
            child:
                Countdown(
              seconds: 120,
              build: (context, double time) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${Strings.resendCode}:",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "${time.round()}",
                      style: TextStyle(
                        color: ResColors.primaryColor,
                        fontSize: 14,
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
                Strings.resendCode,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 6,
              ),
              InkWell(
                onTap: () {
                  controller.invalidCode = false;
                  controller.startTimer();
                  controller.resendSms();
                },
                child: Text(
                  Strings.sending,
                  style: TextStyle(
                    color: ResColors.primaryColor,
                    fontSize: 14,
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
