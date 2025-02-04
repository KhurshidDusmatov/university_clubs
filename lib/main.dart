import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:univesity_clubs/data/routes/route_helper.dart';
import 'set_up.dart';

void main() async {
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'University clubs',
      theme: ThemeData(
          fontFamily: 'Mulish',
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(color: Colors.white),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xffFF014A),
            secondary: const Color(0xffFF014A),
          )
      ),
      getPages: RouteHelper.routes,
      initialRoute: RouteHelper.getInitial(),
    );
  }
}

