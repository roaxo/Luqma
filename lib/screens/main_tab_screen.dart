import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proto/common/color_extension.dart';
import 'package:proto/controllers/main_tab_controller.dart';
import 'package:proto/widgets/tab_button.dart';

class MainTabScreen extends StatelessWidget {
  MainTabScreen({super.key});

  final controller = Get.put(MainTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => PageStorage(
          bucket: controller.storageBucket,
          child: controller.currentPage,
        ),
      ),
      backgroundColor: const Color(0xfff5f5f5),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: Obx(
          () => FloatingActionButton(
            onPressed: () => controller.selectTab(2),
            shape: const CircleBorder(),
            backgroundColor: controller.selectedTab.value == 2
                ? TColor.primary
                : TColor.placeholder,
            child: Image.asset(
              "assets/images/tab_home.png",
              width: 30,
              height: 30,
            ),
          ),  
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          surfaceTintColor: TColor.white,
          shadowColor: Colors.black,
          elevation: 1,
          notchMargin: 12,
          height: 64,
          shape: const CircularNotchedRectangle(),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TabButton(
                  onTap: () => controller.selectedTab(4),
                  title: "المزيد",
                  icon: "assets/images/tab_more.png",
                  isSelected: controller.selectedTab.value == 4,
                ),
                TabButton(
                  onTap: () => controller.selectedTab(3),
                  title: "الشخصية",
                  icon: "assets/images/tab_profile.png",
                  isSelected: controller.selectedTab.value == 3,
                ),

                const SizedBox(width: 40, height: 40),

                TabButton(
                  onTap: () => controller.selectedTab(1),
                  title: "العروض",
                  icon: "assets/images/tab_offer.png",
                  isSelected: controller.selectedTab.value == 1,
                ),

                TabButton(
                  onTap: () => controller.selectedTab(0),
                  title: "المنيو",
                  icon: "assets/images/tab_menu.png",
                  isSelected: controller.selectedTab.value == 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
