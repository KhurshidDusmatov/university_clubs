import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:univesity_clubs/controller/home/home_controller.dart';
import 'package:univesity_clubs/view/home_page/widgets/club_info.dart';

class MyClubsPage extends StatelessWidget {
  const MyClubsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(),
            body: Column(children: [
              SizedBox(height: 10),
              Expanded(
                child: controller.myClubList.isEmpty
                    ? Center(child: Text("Klublar topilmadi"))
                    : ListView.builder(
                        itemCount: controller.myClubList.length,
                        itemBuilder: (context, index) {
                          final club = controller.myClubList[index];
                          return ClubInfo(club: club);
                        },
                      ),
              ),
            ]));
      },
    );
  }
}
