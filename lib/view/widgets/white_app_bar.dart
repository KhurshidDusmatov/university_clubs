import 'dart:io';
import 'package:flutter/material.dart';
import 'package:univesity_clubs/data/tools/const/res_colors.dart';

class WhiteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WhiteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: InkWell(
          child: Platform.isIOS
              ? const Icon(Icons.arrow_back_ios_new,
                  size: 25, color: ResColors.primaryBlackText)
              : const Icon(Icons.arrow_back,
                  size: 25, color: ResColors.primaryBlackText),
          onTap: () {
            Navigator.pop(context);
          },
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
