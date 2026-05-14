import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class RecentItemRow extends StatelessWidget {
  final Map rObj;
  final VoidCallback onTap;
  const RecentItemRow({super.key, required this.rObj, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    rObj["name"],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        rObj["type"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        " . ",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: TColor.primary, fontSize: 11),
                      ),
                      Text(
                        rObj["food_type"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        "assets/images/rate.png",
                        width: 10,
                        height: 10,
                        fit: BoxFit.cover,
                      ),

                      const SizedBox(width: 4),
                      Text(
                        rObj["rate"],
                        textAlign: TextAlign.center,
                        style: TextStyle(color: TColor.primary, fontSize: 11),
                      ),

                      const SizedBox(width: 8),

                      Text(
                        "(${rObj["rating"]} Ratings)",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                rObj["image"].toString(),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
