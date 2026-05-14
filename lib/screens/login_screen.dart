import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proto/common/color_extension.dart';
import 'package:proto/screens/on_board_screen.dart';
import 'package:proto/screens/signup_screen.dart';
import 'package:proto/widgets/round_button.dart';
import 'package:proto/widgets/round_icon_button.dart';
import 'package:proto/widgets/round_textfeild.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                Text(
                  "سجل الدخول",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "دخل بيناتك.. الأكل مستنييك",
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 25),

                RoundTextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "ايميلك",
                ),

                const SizedBox(height: 25),
                RoundTextField(
                  controller: passController,
                  keyboardType: TextInputType.visiblePassword,
                  hintText: "كلمة المرور",
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                RoundButton(
                  onTap: () {
                    Get.offAll(() => OnBoardScreen());
                  },
                  title: "دخول",
                ),

                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "نسيت كلمة المرور؟",
                    style: TextStyle(
                      color: TColor.placeholder,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "او ادخل بأستخادام",
                    style: TextStyle(
                      color: TColor.placeholder,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                RoundIconButton(
                  title: "ادخل بأسخدام الفيس بوك",
                  color: const Color(0xff367FC0),
                  icon: "assets/images/facebook_logo.png",
                ),

                const SizedBox(height: 25),
                RoundIconButton(
                  title: "     ادخل بأسخدام جوجل ",
                  color: const Color(0xffDD4B39),
                  icon: "assets/images/google_logo.png",
                ),
                const SizedBox(height: 40),

                TextButton(
                  onPressed: () {
                    Get.to(() => SignupScreen());
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "اعمل حساب جديد ",
                        style: TextStyle(
                          color: TColor.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "معندكش حساب؟  ",

                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
