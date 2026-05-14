import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proto/screens/checkout_screen.dart';

import '../common/color_extension.dart' show TColor;
import '../widgets/round_button.dart';

class MyOrderScreen extends StatelessWidget {
  MyOrderScreen({super.key});
  List itemArr = [
    {"name": "بيف برجر", "qty": "1", "price": 160.0},
    {"name": "كلاسيك تشييز برجر", "qty": "1", "price": 140.0},
    {"name": "شاورما دجاج", "qty": "1", "price": 170.0},
    {"name": "بيتزا تاندوري", "qty": "1", "price": 150.0},
    {"name": "بطاطس حجم كبير", "qty": "1", "price": 60.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: TColor.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Image.asset(
                        "assets/images/btn_back.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "طلباتي",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 25,
                ),

                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(15),
                      child: Image.asset(
                        "assets/images/cairo_burger.png",
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            "كايرو برجر",
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/images/rate.png",
                                width: 10,
                                height: 10,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "4.9",
                                style: TextStyle(
                                  color: TColor.primary,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "( تقييمات 124)",
                                style: TextStyle(
                                  color: TColor.secondaryText,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "برجر",
                                style: TextStyle(
                                  color: TColor.secondaryText,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                " . ",
                                style: TextStyle(
                                  color: TColor.primary,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "Western Food",
                                style: TextStyle(
                                  color: TColor.secondaryText,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/images/location-pin.png",
                                width: 13,
                                height: 13,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "رقم 03, شارغ 4, دمنهور",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: TColor.secondaryText,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: itemArr.length,
                separatorBuilder: ((context, index) => Divider(
                  indent: 25,
                  endIndent: 25,
                  color: TColor.secondaryText.withOpacity(0.4),
                  height: 1,
                )),
                itemBuilder: ((context, index) {
                  var cObj = itemArr[index] as Map? ?? {};
                  return Container(
                    decoration: BoxDecoration(color: TColor.textfield),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cObj["name"].toString(),
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${cObj["qty"].toString()}x",
                              style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(width: 15),
                        Text(
                          cObj["price"].toString(),
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "دفع كاش عند الأستلام",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        // const SizedBox(width: 15),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.add, color: TColor.primary),
                          label: Text(
                            "سيب ملاحظة",
                            style: TextStyle(
                              color: TColor.primary,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: TColor.secondaryText.withOpacity(0.5),
                      height: 1,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "مجموع الطلب ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "680 ج.م",
                          style: TextStyle(
                            color: TColor.primary,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "التوصيل",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "15 ج.م",
                          style: TextStyle(
                            color: TColor.primary,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Divider(
                      color: TColor.secondaryText.withOpacity(0.5),
                      height: 1,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "المجموع الكلي",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "695 ج.م",
                          style: TextStyle(
                            color: TColor.primary,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 35),
                    RoundButton(
                      title: "الدفع",
                      onTap: () {
                        Get.to(() => (CheckoutScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
