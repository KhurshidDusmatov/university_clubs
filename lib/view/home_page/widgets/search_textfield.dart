import 'package:flutter/material.dart';
import 'package:univesity_clubs/controller/home/home_controller.dart';
import 'package:univesity_clubs/data/tools/const/res_colors.dart';
import 'package:univesity_clubs/data/tools/const/string.dart';

class SearchTextfield extends StatelessWidget {
  final HomeController controller;
  const SearchTextfield({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
            color: const Color(0xffF2F1EF),
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: ResColors.blackWithOpacity)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 17),
              height: 20,
              width: 20,
              child: Image.asset('assets/icons/search.png'),
            ),
            Flexible(
              child: TextField(
                controller: controller.searchController,
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.fromLTRB(5, 5, 0, 5),
                  hintText: Strings.search,
                  hintStyle: TextStyle(
                      fontSize: 16, color: const Color(0xffABAFB6)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none),
                ),
                style: TextStyle(
                  fontSize: 14,
                ),
                autocorrect: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
