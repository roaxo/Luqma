import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:proto/common/color_extension.dart';

class RoundTextField extends StatelessWidget {
  final TextEditingController controller;

  final String hintText;

  final TextInputType? keyboardType;

  final bool obscureText;

  final String? title;

  final Widget? suffixIcon;

  Color? fillColor;

  RoundTextField({
    Key? key,

    required this.controller,

    required this.hintText,

    this.keyboardType,

    this.obscureText = false,

    this.title,

    this.suffixIcon,

    this.fillColor,
  }) : super(key: key);

  final hasText = false.obs;

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      hasText.value = controller.text.isNotEmpty;
    });

    return Obx(
      () => TextField(
        controller: controller,

        textDirection: TextDirection.rtl,

        textAlign: TextAlign.right,

        keyboardType: keyboardType,

        obscureText: obscureText,

        decoration: InputDecoration(
          labelText: title,

          floatingLabelBehavior: FloatingLabelBehavior.always,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,

            vertical: 12,
          ),

          suffixIcon: suffixIcon,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),

            borderSide: BorderSide(
              color: hasText.value ? TColor.primary : TColor.placeholder,

              width: 1.5,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),

            borderSide: BorderSide(color: TColor.primary, width: 2),
          ),

          hintTextDirection: TextDirection.rtl,

          hintText: hintText,
          hintStyle: TextStyle(
            color: TColor.placeholder,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
