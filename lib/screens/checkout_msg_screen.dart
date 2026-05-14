import 'package:flutter/material.dart'
    show IconButton, Icons, Scaffold, TextButton;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:proto/widgets/round_button.dart';

import '../common/color_extension.dart';

class CheckoutMsgScreen extends StatelessWidget {
  const CheckoutMsgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        width: media.width,
        decoration: BoxDecoration(
          color: TColor.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.close, color: TColor.primaryText, size: 25),
                ),
              ],
            ),

            Image.asset(
              "assets/images/thank_you.png",
              width: media.width * 0.5,
            ),
            const SizedBox(height: 20),
            Text(
              "شكرًا !",
              style: TextStyle(
                color: TColor.primaryText,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "على طلبك",
              style: TextStyle(
                color: TColor.primaryText,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "طلبك دلوقتي بيتجهّز، وأول ما يطلع من المطعم هنبعتلك إشعار. تقدر تتابع حالة الطلب في أي وقت.",
              textAlign: TextAlign.center,
              style: TextStyle(color: TColor.primaryText, fontSize: 14),
            ),
            const SizedBox(height: 35),
            RoundButton(title: "تابع الطلب", onTap: () {}),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
