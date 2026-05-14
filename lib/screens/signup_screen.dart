import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proto/common/color_extension.dart';
import 'package:proto/screens/login_screen.dart';
import 'package:proto/screens/on_board_screen.dart';
import 'package:proto/widgets/dropdown_governate.dart';
import 'package:proto/widgets/round_textfeild.dart';

import '../widgets/round_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confPassController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController mobController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();
    confPassController.dispose();
    fNameController.dispose();
    lNameController.dispose();
    mobController.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(height: 25),
                    Text(
                      "اعمل حساب جديد ",
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
                      controller: fNameController,
                      hintText: "اسمك الأول",
                    ),

                    const SizedBox(height: 25),
                    RoundTextField(
                      controller: lNameController,
                      hintText: "اسم العيلة",
                    ),
                    const SizedBox(height: 25),

                    RoundTextField(
                      hintText: "ايميلك",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 25),
                    RoundTextField(
                      hintText: "رقم تيليفونك",
                      controller: mobController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 25),
                    DropdownGovernate(),
                    const SizedBox(height: 25),
                    RoundTextField(
                      hintText: "عنوانك (المدينة | الشارع | رقم البيت)",
                      controller: addressController,
                    ),
                    const SizedBox(height: 25),
                    RoundTextField(
                      hintText: "كلمة المرور",
                      controller: passController,
                      obscureText: true,
                    ),
                    const SizedBox(height: 25),
                    RoundTextField(
                      hintText: " اكد على كلمة المرور",
                      controller: confPassController,
                      obscureText: true,
                    ),
                    const SizedBox(height: 25),

                    RoundButton(
                      onTap: () {
                        Get.offAll(() => OnBoardScreen());
                      },
                      title: "يلا بينا",
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "يلا ادخل ",
                            style: TextStyle(
                              color: TColor.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "عندك حساب؟  ",

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
