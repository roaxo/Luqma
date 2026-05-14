// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:proto/common/color_extension.dart';

enum RoundButtonType { bgPrimary, textPrimary }

// ignore: must_be_immutable
class RoundButton extends StatelessWidget {
  final void Function()? onTap;
  String title;
  double? fontSize;
  final RoundButtonType type;

  RoundButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.fontSize,
    this.type = RoundButtonType.bgPrimary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: type == RoundButtonType.bgPrimary
              ? null
              : Border.all(color: TColor.primary, width: 1),
          color: type == RoundButtonType.bgPrimary
              ? TColor.primary
              : TColor.white,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: type == RoundButtonType.bgPrimary
                ? TColor.white
                : TColor.primary,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
