import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:proto/screens/home_screen.dart';
import '../screens/menu_screen.dart';
import '../screens/more_screen.dart' show MoreScreen;
import '../screens/offer_screen.dart';
import '../screens/profile_screen.dart';

class MainTabController extends GetxController{
    final selectedTab = 2.obs;
     final PageStorageBucket storageBucket = PageStorageBucket();

    
  Widget get currentPage {
    switch (selectedTab.value) {
      case 0:
        return  MenuScreen();
      case 1:
        return  OfferScreen();
      case 2:
        return  HomeScreen();
      case 3:
        return  ProfileScreen();
      case 4:
        return  MoreScreen();
      default:
        return  HomeScreen();
    }
  }

  void selectTab(int index){
    selectedTab.value = index;
  }


}