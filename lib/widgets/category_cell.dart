// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class CategoryCell extends StatelessWidget {
  final Map cObj;
  final VoidCallback onTap;
  const CategoryCell({Key? key, required this.cObj, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: TColor.primary.withOpacity(0.5),
          // border: BoxBorder.all(color: TColor.primary, width: 2)
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                cObj["image"].toString(),
                width: 72,
                height: 72,
                fit: BoxFit.contain,
              ),
              Text(
                cObj["name"],
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
