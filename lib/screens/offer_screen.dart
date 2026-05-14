import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proto/screens/my_order_screen.dart';
import 'package:proto/widgets/round_button.dart';

import '../common/color_extension.dart';
import '../widgets/menu_item_row.dart';

class OfferScreen extends StatelessWidget {
  OfferScreen({super.key});

  TextEditingController txtSearch = TextEditingController();

  List offerArr = [
    {
      "image": "assets/images/offer_1.png",
      "name": "Café de Noires",
      "rate": "4.9",
      "rating": "124",
      "type": "Jamal Bakery",
      "food_type": "حلو",
    },
    {
      "image": "assets/images/offer_2.png",
      "name": "Isso",
      "rate": "4.9",
      "rating": "124",
      "type": "Jamal Bakery",
      "food_type": "حلو",
    },
    {
      "image": "assets/images/offer_3.png",
      "name": "Cafe Beans",
      "rate": "4.9",
      "rating": "124",
      "type": "Jamal Bakery",
      "food_type": "حلو",
    },
    {
      "image": "assets/images/offer_1.png",
      "name": "Café de Noires",
      "rate": "4.9",
      "rating": "124",
      "type": "Jamal Bakery",
      "food_type": "حلو",
    },
    {
      "image": "assets/images/offer_2.png",
      "name": "Isso",
      "rate": "4.9",
      "rating": "124",
      "type": "Jamal Bakery",
      "food_type": "حلو",
    },
    {
      "image": "assets/images/offer_3.png",
      "name": "Cafe Beans",
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "اخر العروض",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        "لاقي خصومات، وعروض على الوجبات اللي بتحبها، وحاجات تانية كتير!",
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: 120,
                    height: 30,
                    child: RoundButton(
                      title: "العروض",
                      fontSize: 12,
                      onTap: () {},
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: offerArr.length,
                  itemBuilder: ((context, index) {
                    var pObj = offerArr[index] as Map? ?? {};
                    return MenuItemRow(mObj: pObj, onTap: () {});
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
