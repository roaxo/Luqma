import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proto/screens/my_order_screen.dart';

import '../common/color_extension.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});

  List aboutTextArr = [
    "إحنا تطبيق لتوصيل الأكل بنسهّل عليك تطلب وجبتك المفضلة من مطاعم كتير وأنت قاعد مكانك. هدفنا نوصل لك الأكل بسرعة وبجودة ومن غير أي تعقيد.",
    "من خلال التطبيق تقدر تتصفح منيوهات مختلفة، تختار اللي نفسك فيه، وتتابع طلبك خطوة بخطوة لحد ما يوصل لحد باب البيت.",
    "بنحاول دايماً نوفرلك اختيارات كتير تناسب كل الأذواق، سواء كنت عايز وجبة سريعة، أكل صحي، أو حتى حاجة حلوة تحلي بيها يومك.",
    "فريقنا شغال طول الوقت عشان يقدملك تجربة سهلة وسريعة وآمنة، من أول ما تفتح التطبيق لحد ما تستلم طلبك.",
    "هدفنا إننا نوفرلك وقت ومجهود، ونخلي تجربة طلب الأكل ممتعة وبسيطة، مع عروض وخصومات تساعدك توفر وتستمتع في نفس الوقت.",
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
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
                            "احنا مين؟",
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

                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: aboutTextArr.length,

                    itemBuilder: ((context, index) {
                      var txt = aboutTextArr[index] as String? ?? "";
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 25,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: TColor.primary,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                txt,
                                style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 14,
                                ),
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
      ),
    );
  }
}
