import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proto/common/color_extension.dart';
import 'package:proto/widgets/category_cell.dart';
import 'package:proto/widgets/most_popular_cell.dart';
import 'package:proto/widgets/offers_carousel.dart';
import 'package:proto/widgets/recent_item_row.dart';
import 'package:proto/widgets/round_textfeild.dart';

import '../widgets/menu_item_row.dart';
import '../widgets/title_row.dart' show TitleRow;
import 'my_order_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController searchController = TextEditingController();
  List catArr = [
    {"image": "assets/images/food_icon.png", "name": "أكل"},
    {"image": "assets/images/supermarket_icon.png", "name": "سوبرماركت"},
    {"image": "assets/images/snacks_icon.png", "name": "سناكس"},
  ];

  List mostPopArr = [
    {
      "image": "assets/images/m_res_1.png",
      "name": "نابولي بيتزا",
      "rate": "4.9",
      "rating": "124",
      "type": "Restraunt",
      "food_type": "Western Food",
    },
    {
      "image": "assets/images/m_res_2.jpeg",
      "name": "كشري التحرير",
      "rate": "4.9",
      "rating": "124",
      "type": "Restraunt",
      "food_type": "Eastern Food",
    },
    {
      "image": "assets/images/m_res_3.jpeg",
      "name": "شاورما دمشق",
      "rate": "4.9",
      "rating": "124",
      "type": "Restraunt",
      "food_type": "Eastern Food",
    },
    {
      "image": "assets/images/m_res_1.png",
      "name": "نابولي بيتزا",
      "rate": "4.9",
      "rating": "124",
      "type": "Restraunt",
      "food_type": "Western Food",
    },
  ];

  List recentArr = [
    {
      "image": "assets/images/item_1.png",
      "name": "نابولي بيتزا",
      "rate": "4.9",
      "rating": "124",
      "type": "Restraunt",
      "food_type": "Western Food",
    },
    {
      "image": "assets/images/item_2.png",
      "name": "شاورما دمشق",
      "rate": "4.9",
      "rating": "124",
      "type": "Restraunt",
      "food_type": "Eastern Food",
    },
    {
      "image": "assets/images/item_3.png",
      "name": "نابولي بيتزا",
      "rate": "4.9",
      "rating": "124",
      "type": "Restraunt",
      "food_type": "Western Food",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //shopping cart / goodmorning
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(() => MyOrderScreen());
                      },
                      icon: Image.asset(
                        "assets/images/shopping_cart.png",
                        width: 25,
                        height: 25,
                      ),
                    ),
                    Text(
                      "صباح الخير, يوسف",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              // --- Delivery Location ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "التوصيل عند",
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          "assets/images/dropdown.png",
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 14),
                        Text(
                          "الموقع الحالي",
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

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

              const SizedBox(height: 35),

              //catagories
              SizedBox(
                height: 120,
                child: ListView.builder(
                  reverse: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: catArr.length,
                  itemBuilder: (context, index) {
                    var cObj = catArr[index] as Map? ?? {};
                    return CategoryCell(cObj: (cObj), onTap: () {});
                  },
                ),
              ),

              const SizedBox(height: 30),
              OffersCarousel(),

              const SizedBox(height: 25),

              //most ordered
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TitleRow(title: "الأكثر طلبا", onView: () {}),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: mostPopArr.length,
                  itemBuilder: (context, index) {
                    var mObj = mostPopArr[index] as Map? ?? {};
                    return MostPopularCell(mObj: (mObj), onTap: () {});
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: TitleRow(title: "مطلوب حديثا", onView: () {}),
              ),

              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: recentArr.length,
                itemBuilder: (context, index) {
                  var rObj = recentArr[index] as Map? ?? {};
                  return RecentItemRow(rObj: (rObj), onTap: () {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
