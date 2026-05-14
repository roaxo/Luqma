import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:proto/screens/about_us_screen.dart';
import 'package:proto/screens/my_order_screen.dart';
import 'package:proto/screens/signup_screen.dart';

import '../common/color_extension.dart';
import 'inbox_screen.dart';
import 'notifications_screen.dart';
import 'payment_details_screen.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({super.key});

  List moreArr = [
    {
      "index": "1",
      "name": "نفاصيل الدفع",
      "image": "assets/images/more_payment.png",
      "base": 0,
    },
    {
      "index": "2",
      "name": "طلباتي",
      "image": "assets/images/more_my_order.png",
      "base": 0,
    },
    {
      "index": "3",
      "name": "الإشعارات",
      "image": "assets/images/more_notification.png",
      "base": 15,
    },
    {
      "index": "4",
      "name": "الرسائل الواردة",
      "image": "assets/images/more_inbox.png",
      "base": 10,
    },
    {
      "index": "5",
      "name": "احنا مين؟",
      "image": "assets/images/more_info.png",
      "base": 0,
    },
    {
      "index": "6",
      "name": "تسجيل الخروج",
      "image": "assets/images/logout.png",
      "base": 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "المزيد",
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
                const SizedBox(height: 40),

                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: moreArr.length,
                  itemBuilder: (context, index) {
                    var mObj = moreArr[index] as Map? ?? {};
                    var countBase = mObj["base"] as int? ?? 0;

                    return InkWell(
                      onTap: () {
                        switch (mObj["index"].toString()) {
                          case "1":
                            Get.to(() => PaymentDetailsScreen());
                            break;
                          case "2":
                            Get.to(() => MyOrderScreen());
                            break;
                          case "3":
                            Get.to(() => NotificationsScreen());
                            break;
                          case "4":
                            Get.to(() => InboxScreen());
                            break;
                          case "5":
                            Get.to(() => AboutUsScreen());
                            break;
                          case "6":
                            Get.off(() => SignupScreen());
                            break;
                          default:
                            break;
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: TColor.textfield,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: TColor.placeholder,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Image.asset(
                                      mObj["image"].toString(),
                                      width: 35,
                                      height: 35,
                                      color: const Color.fromARGB(
                                        255,
                                        106,
                                        74,
                                        74,
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),

                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Text(
                                      mObj["name"].toString(),
                                      style: TextStyle(
                                        color: TColor.primaryText,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  if (countBase > 0)
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(
                                          12.5,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        countBase.toString(),
                                        style: TextStyle(
                                          color: TColor.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),

                            Container(
                              height: 25,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: TColor.textfield,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.asset(
                                "assets/images/btn_left.png",
                                width: 15,
                                height: 15,
                                color: TColor.primaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }, // End of itemBuilder
                ), // End of ListView.builder
              ], // End of Column children
            ), // End of Column
          ), // End of SingleChildScrollView
        ), // End of SafeArea
      ), // End of Scaffold
    ); // End of Directionality
  }
}
