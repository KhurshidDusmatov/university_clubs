import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'data/storage/auth/auth_prefs.dart';
import 'injection.dart';

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await DIService.init();
  await Hive.initFlutter();
  await Hive.openBox(AuthPrefs.authBoxID);
}