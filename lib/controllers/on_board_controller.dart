import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proto/screens/main_tab_screen.dart';

class OnBoardController extends GetxController {
  var selectPage = 0.obs;
  final PageController controller = PageController();

  void onPageChanged(int indx){
    selectPage.value = indx;
  }

  void nextPage() {
    if (selectPage.value >= 2) {
      Get.offAll(() =>  MainTabScreen());
    } else {
      selectPage.value++;
      controller.animateToPage(
        selectPage.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

}

