import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proto/screens/my_order_screen.dart';

import '../common/color_extension.dart';

class NotificationsScreen extends StatelessWidget {
   NotificationsScreen({super.key});

  List notificationArr = [
    {"title": "طلبك اتسلم من المطعم", "time": "دلوقتي"},
    {"title": "الأكل في الطريق!", "time": "دلوقتي"},
    {"title": "طلبك اتسلم من المطعم", "time": "دلوقتي"},
    {"title": "طلبك وصل", "time": "من ساعة"},
    {"title": "طلبك اتسلم من المطعم", "time": "من ٣ ساعات"},
    {"title": "طلبك وصل", "time": "من ٥ ساعات"},
    {"title": "طلبك اتسلم من المطعم", "time": "٥ يونيو ٢٠٢٣"},
    {"title": "طلبك وصل", "time": "٥ يونيو ٢٠٢٣"},
    {"title": "الأكل في الطريق!", "time": "٦ يونيو ٢٠٢٣"},
    {"title": "طلبك وصل", "time": "٦ يونيو ٢٠٢٣"},
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                          "assets/images/btn_back.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "الاشعارات",
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
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
                const SizedBox(height: 20),

                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: notificationArr.length,
                  separatorBuilder: ((context, index) => Divider(
                    indent: 25,
                    endIndent: 25,
                    color: TColor.secondaryText.withOpacity(0.4),
                    height: 1,
                  )),
                  itemBuilder: ((context, index) {
                    var cObj = notificationArr[index] as Map? ?? {};
                    return Container(
                      decoration: BoxDecoration(
                        color: index % 2 == 0 ? TColor.white : TColor.textfield,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 25,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: TColor.primary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cObj["title"].toString(),
                                  style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  cObj["time"].toString(),
                                  style: TextStyle(
                                    color: TColor.secondaryText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
