import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:univesity_clubs/controller/base/base_controller.dart';
import 'package:univesity_clubs/domain/data/club/club_model.dart';

class HomeController extends BaseController {

  TextEditingController searchController = TextEditingController();
  List<ClubModel> clubList = [];
  List<ClubModel> myClubList = [];
  List<ClubModel> filteredClubList = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    loadClubs();
    searchController.addListener(() {
      searchClubs(searchController.text);
    });
  }

  void loadClubs() {
    final box = Hive.box<ClubModel>('clubBox');
    clubList = box.values.toList();
    final box2 = Hive.box<ClubModel>('myClubsBox');
    myClubList = box2.values.toList();
    filteredClubList = List.from(clubList);
    update();
  }

  void searchClubs(String query) {
    if (query.isEmpty) {
      filteredClubList = List.from(clubList);
    } else {
      filteredClubList = clubList
          .where((club) =>
          club.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    update();
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    loadClubs();
  }
}
