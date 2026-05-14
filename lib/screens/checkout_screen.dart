import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proto/screens/add_card_screen.dart';
import 'package:proto/screens/checkout_msg_screen.dart';
import 'package:proto/screens/map_screen.dart';
import '../common/color_extension.dart';
import '../widgets/round_button.dart';
  
class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  List paymentArr = [
    {"name": "دفع كاش", "icon": "assets/images/cash.png"},
    {"name": "**** **** **** 2187", "icon": "assets/images/visa_icon.png"},
    {"name": "فودافون كاش", "icon": "assets/images/vodafone_icon.png"},
  ];

  final RxInt selectMethod = (-1).obs;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: TColor.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          "الدفع",
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
                  padding: const EdgeInsets.symmetric(horizontal: 25),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Text(
                        "العنوان",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "فيلا 03, قسم 4 - شارع الصنهوري, دمنهور",
                              style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          TextButton(
                            onPressed: () {
                              Get.to(() => (MapScreen()));
                            },
                            child: Text(
                              "غير العنوان",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: TColor.primary,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  decoration: BoxDecoration(color: TColor.textfield),
                  height: 8,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "طريقة الدفع",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          // const SizedBox(width: 15),
                          TextButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                builder: (context) {
                                  return const AddCardScreen();
                                },
                              );
                            },
                            icon: Icon(Icons.add, color: TColor.primary),
                            label: Text(
                              "ضيف كارت",
                              style: TextStyle(
                                color: TColor.primary,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),

                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: paymentArr.length,
                        itemBuilder: (context, index) {
                          var pObj = paymentArr[index] as Map? ?? {};
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 15.0,
                            ),
                            decoration: BoxDecoration(
                              color: TColor.textfield,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: TColor.secondaryText.withOpacity(0.2),
                              ),
                            ),
                            child: Obx(
                              () => Row(
                                children: [
                                  Image.asset(
                                    pObj["icon"].toString(),
                                    width: 50,
                                    height: 20,
                                    fit: BoxFit.contain,
                                  ),
                                  // const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      pObj["name"],
                                      style: TextStyle(
                                        color: TColor.primaryText,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),

                                  InkWell(
                                    onTap: () {
                                      selectMethod.value = index;
                                    },
                                    child: Icon(
                                      selectMethod.value == index
                                          ? Icons.radio_button_on
                                          : Icons.radio_button_off,
                                      color: TColor.primary,
                                      size: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(color: TColor.textfield),
                  height: 8,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "مجموع الطلب ",
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // SizedBox(width: 120),
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
                              fontWeight: FontWeight.w500,
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
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "خصم",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "40- ج.م",
                            style: TextStyle(
                              color: TColor.primaryText,
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
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "655 ج.م",

                            style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(color: TColor.textfield),
                  height: 8,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 25,
                  ),
                  child: RoundButton(
                    title: "أكد الطلب",
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        builder: (context) {
                          return const CheckoutMsgScreen();
                        },
                      );
                    },
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
