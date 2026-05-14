import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proto/common/color_extension.dart';
import 'package:proto/screens/login_screen.dart';
import 'package:proto/screens/signup_screen.dart';
import 'package:proto/widgets/round_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    "assets/images/welcome_top_shape.png",
                    width: media.width,
                  ),

                  Positioned(
                    top: 240,
                    child: Image.asset(
                      "assets/images/luqma-hand.png",
                      width: media.width * 0.5,
                      height: media.width * 0.5,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "جعان؟  اكتشف أماكن أكل قريبة منك تشبعك! كل اللي نفسك فيه دلوقتي بقى أقرب وسرع من أي وقت",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              SizedBox(height: media.width * 0.1),
              Padding(
                padding: const EdgeInsets.all(25),
                child: RoundButton(
                  title: "سجل الدخول",
                  onTap: () {
                    Get.off(() => LoginScreen());
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: RoundButton(
                  title: "اعمل حساب جديد",
                  onTap: () {
                    Get.off(() => SignupScreen());
                  },
                  type: RoundButtonType.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
