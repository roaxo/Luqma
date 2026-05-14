import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proto/screens/my_order_screen.dart';

import '../common/color_extension.dart';

class InboxScreen extends StatelessWidget {
  InboxScreen({super.key});

  List inboxArr = [
    {
      "title": "عروض Luqma",
      "detail":
          "عندنا ليك عروض وخصومات جامدة على أكلات كتير. اطلب دلوقتي واستمتع بأحلى طعم وسعر حلو.",
    },
    {
      "title": "عروض Luqma",
      "detail":
          "في وجبات جديدة نزلت على التطبيق! جرّب حاجة مختلفة واستمتع بتجربة أكل جديدة.",
    },
    {
      "title": "عروض Luqma",
      "detail":
          "خصومات خاصة لفترة محدودة، متفوتهاش واطلب أكلك المفضل بأقل سعر.",
    },
    {
      "title": "عروض Luqma",
      "detail": "مطاعم جديدة انضمت لينا، اختار اللي يعجبك واطلب بسهولة وسرعة.",
    },
    {
      "title": "عروض Luqma",
      "detail": "اطلب دلوقتي وخد توصيل سريع لحد باب البيت من غير تعب.",
    },
    {
      "title": "عروض Luqma",
      "detail": "في كاش باك وعروض حصرية ليك، استغلها قبل ما تخلص.",
    },
    {
      "title": "عروض Luqma",
      "detail": "جعان؟ افتح التطبيق واختار من أحلى الوجبات والعروض المتاحة.",
    },
    {
      "title": "عروض Luqma",
      "detail": "وفر فلوسك مع الخصومات الجديدة على وجباتك المفضلة.",
    },
    {
      "title": "عروض Luqma",
      "detail": "اختيارات كتير وطعم حلو مستنيك، اطلب دلوقتي بسهولة.",
    },
    {
      "title": "عروض Luqma",
      "detail": "وجبات ساخنة وتوصيل سريع، جرب بنفسك واحكم.",
    },
    {
      "title": "عروض Luqma",
      "detail": "عروض نهاية الأسبوع جاهزة، اطلب واستمتع بأحلى أكلة.",
    },
    {
      "title": "عروض Luqma",
      "detail": "متحتارش تاكل إيه، إحنا جايبينلك أحسن الاختيارات والعروض.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
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
                          "الرسائل",
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
                  itemCount: inboxArr.length,
                  separatorBuilder: ((context, index) => Divider(
                    indent: 25,
                    endIndent: 25,
                    color: TColor.secondaryText.withOpacity(0.4),
                    height: 1,
                  )),
                  itemBuilder: ((context, index) {
                    var cObj = inboxArr[index] as Map? ?? {};
                    return Container(
                      decoration: BoxDecoration(
                        color: index % 4 != 1 ? TColor.white : TColor.textfield,
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
                                  cObj["detail"].toString(),
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: TColor.secondaryText,
                                    fontSize: 14,
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
