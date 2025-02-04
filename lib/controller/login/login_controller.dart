import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:univesity_clubs/controller/base/base_controller.dart';
import 'package:univesity_clubs/data/storage/auth/auth_holder.dart';
import 'package:univesity_clubs/data/tools/const/string.dart';
import 'package:univesity_clubs/data/tools/service/connectivity_service/connection.dart';
import 'package:univesity_clubs/domain/entities/login/login_request.dart';
import 'package:univesity_clubs/view/verification_page/verification_page.dart';
import 'package:univesity_clubs/view/widgets/snackbar.dart';
import '../../domain/use_case/login/login_use_case.dart';

class LoginController extends BaseController {
  bool isLoading = true;
  bool phoneNotValid = false;
  String signature = '';
  LoginUseCase loginUseCase;
  TextEditingController phoneController = TextEditingController();

  LoginController(this.loginUseCase);

  @override
  dispose() {
    super.dispose();
    phoneController.dispose();
  }

  Future<void> login() async {
    Iterable<Match> matches = RegExp(r'\d+').allMatches(phoneController.text.trim());
    String phone = matches.map((m) => m.group(0)).join('');

    if (await CheckNet().checkInternet() == false) {
      Get.snackbar(Strings.appName, Strings.noInternet);
      return;
    }
    if (phone.length != 9) {
      phoneNotValid = true;
      update();
      return;
    } else {
      phoneNotValid = false;
      update();
    }

    LoginRequest request = LoginRequest(phone, signature);

    try {
      await for (final event in loginUseCase.invoke(request)) {
        event.when(
          loading: () {
            isLoading = true;
            update();
          },
          content: (content) async {
            final value = content.toJson();
            if (value['isError'] == true) {
              Get.snackbar("University clubs", "Bu raqam serverda mavjud emas, avval ro'yxatdan o'ting");
            } else if (value['isError'] == false) {
              Get.find<AuthHolder>().phone = phone;
              Get.to(() => const VerificationPage(),
                  transition: Transition.rightToLeftWithFade);
            } else {
              Get.snackbar("University clubs", "Kutilmagan xatolik");
              return;
            }
            update();
          },
          error: (error) async {
            if (error == "401") {
              print('ERORRRR BODYYY::::$error');
              return;
            }
            showSnackBar(text: error.toString());
          },
        );
      }
    } catch (e) {
      showSnackBar(text: e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }
}
