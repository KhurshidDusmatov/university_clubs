import 'package:univesity_clubs/controller/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:univesity_clubs/data/storage/auth/auth_holder.dart';
import 'package:univesity_clubs/data/tools/const/string.dart';
import 'package:univesity_clubs/data/tools/service/connectivity_service/connection.dart';
import 'package:univesity_clubs/domain/entities/registration/register_request.dart';
import 'package:univesity_clubs/domain/use_case/registration/register_use_case.dart';
import 'package:univesity_clubs/view/verification_page/verification_page.dart';
import 'package:univesity_clubs/view/widgets/snackbar.dart';

class RegistrationController extends BaseController {
  bool isLoading = false;
  String signature = '';
  bool emptyName = false;
  bool phoneNotValid = false;
  RegisterUseCase registerUseCase;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  RegistrationController(this.registerUseCase);

  @override
  dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
  Future<void> registration() async {
    Iterable<Match> matches =
    RegExp(r'\d+').allMatches(phoneNumberController.text.trim());
    String result = matches.map((m) => m.group(0)).join('');
    String name = nameController.text.trim();
    String phone = result;

    if (await CheckNet().checkInternet() == false) {
      Get.snackbar(Strings.appName, Strings.noInternet);
      return;
    }
    if (name.isEmpty) {
      emptyName = true;
      update();
      return;
    } else {
      emptyName = false;
      update();
    }
    if (phone.length != 9) {
      phoneNotValid = true;
      update();
      return;
    } else {
      phoneNotValid = false;
      update();
    }

    RegisterRequest request = RegisterRequest(name, phone, signature);

    try {
      await for (final event in registerUseCase.invoke(request)!) {
        event.when(
          loading: () {
            isLoading = true;
            update();
          },
          content: (content) async {
            final value = content.toJson();
            if (value['isError'] == true) {
              Get.snackbar(Strings.appName, value['message'].toString());
            } else if (value['isError'] == false) {
              Get.find<AuthHolder>().phone = phone;
              Get.to(() => const VerificationPage(),
                  transition: Transition.rightToLeftWithFade);
            } else {
              Get.snackbar(Strings.appName, Strings.unKnownError);
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
