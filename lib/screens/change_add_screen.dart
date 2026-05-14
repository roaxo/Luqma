import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/color_extension.dart';

class ChangeAddScreen extends StatefulWidget {
  const ChangeAddScreen({super.key});

  @override
  State<ChangeAddScreen> createState() => _ChangeAddScreenState();
}

class _ChangeAddScreenState extends State<ChangeAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset(
              "assets/images/btn_back.png",
              width: 20,
              height: 20,
            ),
          ),
          title: Text(
            "غير العنوان",
            style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
        ),
      ),
    );
  }
}
