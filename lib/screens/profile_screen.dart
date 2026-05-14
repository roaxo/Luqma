import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proto/widgets/round_button.dart';
import 'package:proto/widgets/round_textfeild.dart';

import '../common/color_extension.dart';
import '../controllers/image_controller.dart';
import 'my_order_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController txtName = TextEditingController();

  TextEditingController txtEmail = TextEditingController();

  TextEditingController txtMobile = TextEditingController();

  TextEditingController txtAddress = TextEditingController();

  TextEditingController txtPassword = TextEditingController();

  TextEditingController txtConfirmPassword = TextEditingController();

  final controller = Get.put(ImageController());

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
                        "حسابي",
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
                const SizedBox(height: 20),

                Obx(
                  () => Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: TColor.primary.withValues(alpha: 0.7),
                    ),

                    child: controller.imagePath.value.isEmpty
                        ? const Icon(
                            Icons.person,
                            size: 60,
                            color: Color.fromARGB(255, 255, 255, 255),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              File(controller.imagePath.value),
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),

                TextButton.icon(
                  icon: const Icon(
                    Icons.edit,
                    size: 12,
                    color: Colors.deepOrange,
                  ),
                  onPressed: () => controller.getImage(),
                  label: Text(
                    "تعديل الحساب",
                    style: TextStyle(color: TColor.primaryText, fontSize: 12),
                  ),
                ),

                Text(
                  " اهلا يا يوسف!",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "تسجيل الخروج",
                    style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: RoundTextField(
                    title: "الاسم",
                    hintText: "يوسف احمد شريف",
                    controller: txtName,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: RoundTextField(
                    title: "الأيميل",
                    hintText: "youssef23@gmail.com",
                    keyboardType: TextInputType.emailAddress,
                    controller: txtEmail,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: RoundTextField(
                    title: "الموبايل",
                    hintText: "01234567890",
                    controller: txtMobile,
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: RoundTextField(
                    title: "العنوان",
                    hintText: "شارع 9 - مدينة نصر - القاهرة",
                    controller: txtAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: RoundTextField(
                    title: " الباسورد",
                    hintText: "* * * * * *",
                    obscureText: true,
                    controller: txtPassword,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: RoundTextField(
                    title: "أكد الباسورد",
                    hintText: "* * * * * *",
                    obscureText: true,
                    controller: txtConfirmPassword,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RoundButton(onTap: () {}, title: "حفظ"),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
