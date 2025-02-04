


import 'package:get/get.dart';
import 'package:univesity_clubs/view/main_page/main_page.dart';

class RouteHelper {
  static const String initial = '/';
  static const String filterPage = '/filter_page';


  static String getInitial() => initial;
  static String getFilterPage() => filterPage;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainPage()),

  ];
}

