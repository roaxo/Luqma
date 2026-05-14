import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proto/common/color_extension.dart';
import 'package:proto/controllers/on_board_controller.dart';
import 'package:proto/widgets/round_button.dart';

// ignore: must_be_immutable
class OnBoardScreen extends StatefulWidget {
  OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final controller = Get.put(OnBoardController());

  List pageArr = [
    {
      "title": " اطلب كل اللي بتحبه",
      "subtitle":
          "توصيل سريع لحد باب بيتك \n أكتشف احلى الأكلات من أكتر من 100 مطعم",
      "image": "assets/images/on_boarding_1.png",
    },
    {
      "title": "توصيل سريع",
      "subtitle": "لو كنت فين - الأكل هيوصلك\nسخن وطازة لبيتك او لشغلك",
      "image": "assets/images/on_boarding_2.png",
    },
    {
      "title": "تابع الأكل لايف",
      "subtitle": " من أول ما تطلبه لحد ما يوصل لك \nتابع الأمل وهو في الطريق",
      "image": "assets/images/on_boarding_3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.controller,
                itemCount: pageArr.length,
                onPageChanged: controller.onPageChanged,
                itemBuilder: ((context, index) {
                  var pObj = pageArr[index] as Map? ?? {};
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: media.width,
                        height: media.width,
                        alignment: Alignment.center,
                        child: Image.asset(
                          pObj["image"].toString(),
                          width: media.width * 0.65,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 35),
                      Text(
                        pObj["title"].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: media.width * 0.05),
                      Text(
                        pObj["subtitle"].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),

            // Indicators + Button
            Column(
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pageArr.asMap().entries.map((entry) {
                      int index = entry.key;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          color: index == controller.selectPage.value
                              ? TColor.primary
                              : TColor.placeholder,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: RoundButton(
                    title: "اللي بعده",
                    onTap: controller.nextPage,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
