import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/color_extension.dart';
import '../widgets/round_textfeild.dart';
import 'menu_items_screen.dart';
import 'my_order_screen.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});
  TextEditingController searchController = TextEditingController();
  List menuArr = [
    {
      "name": "الاكل",
      "image": "assets/images/menu_1.png",
      "items_count": "120",
    },
    {
      "name": "المشروبات",
      "image": "assets/images/menu_2.png",
      "items_count": "220",
    },
    {
      "name": "الحلو",
      "image": "assets/images/menu_3.png",
      "items_count": "155",
    },
    {"name": "عروض", "image": "assets/images/menu_4.png", "items_count": "25"},
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 120),
              width: media.width * 0.27,
              height: media.height * 0.65,
              decoration: BoxDecoration(
                color: TColor.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                ),
              ),
            ),
            Column(
              children: [
                // shopping cart / good morning
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {                          Get.to(() => MyOrderScreen());
},
                        icon: Image.asset(
                          "assets/images/shopping_cart.png",
                          width: 25,
                          height: 25,
                        ),
                      ),
                      Text(
                        "المنيو",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
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
                    hintText: "نفسك في ايه؟",
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

                const SizedBox(height: 25),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  itemCount: menuArr.length,
                  itemBuilder: (context, index) {
                    var mObj = menuArr[index] as Map? ?? {};
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => MenuItemsScreen(mObj: mObj));
                      },
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                              right: 40,
                              left: 10,
                            ),
                            width: 400,
                            height: 90,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,

                                  children: [
                                    Text(
                                      mObj["name"],
                                      style: TextStyle(
                                        color: TColor.primaryText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "${mObj["items_count"].toString()} items",
                                      style: TextStyle(
                                        color: TColor.secondaryText,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 20),

                              Image.asset(
                                mObj["image"].toString(),
                                width: 82,
                                height: 82,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(17.5),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),

                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/btn_left.png",
                              width: 15,
                              height: 15,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
