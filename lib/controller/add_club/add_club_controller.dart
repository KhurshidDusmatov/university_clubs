import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:univesity_clubs/controller/base/base_controller.dart';
import 'package:univesity_clubs/controller/home/home_controller.dart';
import 'package:univesity_clubs/data/tools/const/string.dart';
import 'package:univesity_clubs/domain/data/club/club_model.dart';


class AddClubController extends BaseController {
  bool emptyTitle = false;
  bool phoneNotValid = false;
  bool emptyDescription = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    phoneController.dispose();
  }

  Future<void> createClub() async {
    try {
      Iterable<Match> matches =
      RegExp(r'\d+').allMatches(phoneController.text.trim());
      String result = matches.map((m) => m.group(0)).join('');
      String title = titleController.text.trim();
      String description = descriptionController.text.trim();
      String phone = result;

      if (title.isEmpty) {
        emptyTitle = true;
        update();
        return;
      } else {
        emptyTitle = false;
        update();
      }
      if (description.isEmpty) {
        emptyDescription = true;
        update();
        return;
      } else {
        emptyDescription = false;
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

      ClubModel club = ClubModel(title: title, description: description, phone: phone);

      Hive.box<ClubModel>('clubBox').add(club);
      Get.find<HomeController>().onRefresh();
      Get.back();
      Get.snackbar(Strings.appName, Strings.clubCreated);
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> deleteClubById(String id) async {
    final box = Hive.box<ClubModel>('clubBox');
    final clubDelete = box.values.firstWhere((club) => club.id == id);
    await clubDelete.delete();
    await Get.find<HomeController>().onRefresh();
  }

  Future<void> followToClub(ClubModel club) async {
    var newClub = club.copyWith();
    Hive.box<ClubModel>('myClubsBox').add(newClub);
    Get.find<HomeController>().onRefresh();
    Get.snackbar(Strings.appName, Strings.youSubscribedToClub);
  }


  Future<void> unfollowToClub(ClubModel club) async {
    var box = Hive.box<ClubModel>('myClubsBox');
    var key = box.keys.firstWhere(
          (k) => box.get(k)?.id == club.id,
      orElse: () => null,
    );

    if (key != null) {
      await box.delete(key);
      Get.find<HomeController>().onRefresh();
      Get.snackbar(Strings.appName, Strings.youUnSubscribedToClub);
    } else {
      Get.snackbar(Strings.appName, "Club not found");
    }
  }

}
