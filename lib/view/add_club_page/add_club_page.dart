import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:univesity_clubs/controller/add_club/add_club_controller.dart';
import 'package:univesity_clubs/data/tools/const/res_colors.dart';
import 'package:univesity_clubs/data/tools/const/string.dart';
import 'package:univesity_clubs/view/widgets/custom_button.dart';
import 'package:univesity_clubs/view/widgets/custom_text_field.dart';

class AddClubPage extends StatelessWidget {
  const AddClubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddClubController>(
      init: AddClubController(),
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(),
            body: Column(
              children: [
                const SizedBox(height: 20),
                Text(Strings.clubCreate, style: TextStyle(
                    fontSize: 22,
                    fontWeight:
                    FontWeight.w700,
                    fontFamily: "Jost",
                    color: ResColors.primaryBlack)),
                const SizedBox(height: 20),
                CustomTextField(
                    hintText: Strings.enterClubTitle,
                    controller: controller.titleController,
                    keyboardType: TextInputType.text,
                    hasPrefixIcon: false,
                    maxLength: -1,
                    textNotValid: controller.emptyTitle),
                const SizedBox(height: 20),
                CustomTextField(
                    hintText: Strings.enterDescription,
                    controller: controller.descriptionController,
                    keyboardType: TextInputType.text,
                    hasPrefixIcon: false,
                    maxLength: -1,
                    textNotValid: controller.emptyDescription),
                const SizedBox(height: 20),
                CustomTextField(
                    hintText: Strings.mobileNumber,
                    controller: controller.phoneController,
                    keyboardType: TextInputType.number,
                    hasPrefixIcon: true,
                    maxLength: 16,
                    textNotValid: controller.phoneNotValid),
                const SizedBox(height: 100),
                CustomButton(
                    title: Strings.save,
                    func: () async {
                      controller.createClub();
                      controller.titleController.clear();
                      controller.descriptionController.clear();
                      controller.phoneController.clear();
                    },
                    height: 50,
                    width: 38,
                    color: ResColors.primaryColor),
              ],
            ));
      },
    );
  }
}
