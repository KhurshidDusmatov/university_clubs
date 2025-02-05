import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:univesity_clubs/controller/base/base_controller.dart';
import 'package:univesity_clubs/data/storage/auth/auth_holder.dart';
import 'package:univesity_clubs/view/home_page/home_page.dart';
import 'package:univesity_clubs/view/login_page/login_page.dart';
import 'package:univesity_clubs/view/profile_page/profile_page.dart';

class MainController extends BaseController {
  bool isLoading = false;
  int _pageIndex=0;
  int get pageIndex =>_pageIndex;
  bool loggedIn=Get.find<AuthHolder>().authToken.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    buildPage();
    _pageIndex=0;
  }

  void setLoginCondition(bool value){
    loggedIn=value;
    update();
  }
  void setFalse(){
    loggedIn=false;
    // isAdmin=false;
    setPageIndex(0);
    update();
  }

  Widget buildPage()  {
    List<Widget> widgets=[];
    if(loggedIn){
      widgets= [
        const HomePage(),
        const ProfilePage(),
      ] ;
    }
    else{
      widgets=[
        const HomePage(),
        const LoginPage(),
      ];
    }
    return widgets[_pageIndex];
  }

  void setPageIndex(int index) {
    _pageIndex=index;
    update();
  }
}
