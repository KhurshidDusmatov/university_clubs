import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:univesity_clubs/controller/home/home_controller.dart';
import 'package:univesity_clubs/view/home_page/widgets/club_info.dart';
import 'package:univesity_clubs/view/home_page/widgets/search_textfield.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(surfaceTintColor: Colors.white),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextfield(controller: controller),
              SizedBox(height: 10),
              Expanded(
                child: controller.filteredClubList.isEmpty
                    ? Center(child: Text("Klublar topilmadi"))
                    : ListView.builder(
                        itemCount: controller.filteredClubList.length,
                        itemBuilder: (context, index) {
                          final club = controller.filteredClubList[index];
                          return ClubInfo(club: club);
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
