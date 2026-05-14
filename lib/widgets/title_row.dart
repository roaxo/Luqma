// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:proto/common/color_extension.dart';

class TitleRow extends StatelessWidget {
  final String title;
  final VoidCallback onView;

  const TitleRow({Key? key, required this.title, required this.onView})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onView,
          child: Text(
            "عرض الكل",
            style: TextStyle(
              color: TColor.primary,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
