import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/color_extension.dart';
import '../widgets/menu_item_row.dart' show MenuItemRow;
import '../widgets/round_textfeild.dart' show RoundTextField;
import '../widgets/title_row.dart' show TitleRow;
import 'menu_item_detail_screen.dart';

class MenuItemsScreen extends StatefulWidget {
  final Map mObj;

  MenuItemsScreen({super.key, required this.mObj});

  @override
  State<MenuItemsScreen> createState() => _MenuItemsScreenState();
}

class _MenuItemsScreenState extends State<MenuItemsScreen> {
  TextEditingController searchController = TextEditingController();

  List menuItemsArr = [
    {
      "image": "assets/images/dess_1.png",
      "name": "فطيرة تفاح فرنسية",
      "rate": "4.9",
      "rating": "124",
      "type": "Jamal Bakery",
      "food_type": "حلو",
    },
    {
      "image": "assets/images/dess_2.png",
      "name": "كيك الشوكولاتة الداكنة",
      "rate": "4.9",
      "rating": "124",
      "type": "Jamal Bakery",
      "food_type": "حلو",
    },
    {
      "image": "assets/images/dess_3.png",
      "name": "شيك شاكي",
      "rate": "4.9",
      "rating": "124",
      "type": "Jamal Bakery",
      "food_type": "حلو",
    },
    {
      "image": "assets/images/dess_4.png",
      "name": "فودجي تشوي براونيز",
      "rate": "4.9",
      "rating": "124",
      "type": "Jamal Bakery",
      "food_type": "حلو",
    },
    {
      "image": "assets/images/dess_1.png",
      "name": "فطيرة تفاح فرنسية",
      "rate": "4.9",
      "rating": "124",
      "type": "Jamal Bakery",
      "food_type": "حلو",
    },
    {
      "image": "assets/images/dess_2.png",
      "name": "كيك الشوكولاتة الداكنة",
      "rate": "4.9",
      "rating": "124",
      "type": "Jamal Bakery",
      "food_type": "حلو",
    },
    {
      "image": "assets/images/dess_3.png",
      "name": "شيك شاكي",
      "rate": "4.9",
      "rating": "124",
      "type": "Jamal Bakery",
      "food_type": "حلو",
    },
    {
      "image": "assets/images/dess_4.png",
      "name": "فودجي تشوي براونيز",
      "rate": "4.9",
      "rating": "124",
      "type": "Jamal Bakery",
      "food_type": "حلو",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Image.asset(
                          "assets/images/btn_back.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          widget.mObj["name"].toString(),
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),

                // --- Search Bar ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RoundTextField(
                    controller: searchController,
                    hintText: "نقسك في ايه؟",
                    suffixIcon: Container(
                      width: 30,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/search.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: menuItemsArr.length,
                  itemBuilder: ((context, index) {
                    var mObj = menuItemsArr[index] as Map? ?? {};
                    return MenuItemRow(
                      mObj: mObj,
                      onTap: () {
                        Get.to(() => MenuItemDetailScreen());
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
