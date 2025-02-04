import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:univesity_clubs/controller/main/main_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.red,
          body: Center(child: Text("Clubs")),
        );
      },
    );
  }
}
