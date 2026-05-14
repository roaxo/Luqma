// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:proto/common/color_extension.dart';

class RoundIconButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final String icon;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;

  RoundIconButton({
    Key? key,
    this.onTap,
    required this.title,
    required this.icon,
    required this.color,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w500,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.all(4),
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(icon, width: 15, height: 15, fit: BoxFit.contain),
            SizedBox(width: 16),

            Text(
              title,
              style: TextStyle(
                color: TColor.white,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
