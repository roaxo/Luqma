import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proto/widgets/round_button.dart';
import '../common/color_extension.dart';
import '../widgets/round_icon_button.dart';
import 'add_card_screen.dart';
import 'my_order_screen.dart';

// 1. Controller to manage selection state
class PaymentController extends GetxController {
  var selectedMethod = "cash".obs;
  void selectMethod(String method) => selectedMethod.value = method;
}

class PaymentDetailsScreen extends StatelessWidget {
  PaymentDetailsScreen({super.key});

  // Inject the controller
  final paymentController = Get.put(PaymentController());

  final List cardArr = [
    {"icon": "assets/images/visa_icon.png", "card": "**** **** **** 2187"},
    {"icon": "assets/images/visa_icon.png", "card": "**** **** **** 8765"},
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Image.asset(
                          "assets/images/btn_back.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "تفاصيل الدفع",
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
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

                const SizedBox(height: 40),

                
                _buildPaymentTile(
                  id: "card",
                  title: "دفع كارت دلوقتي ",
                  icon: "assets/images/cash_icon.png",
                ),

                const SizedBox(height: 40),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: Text(
                    "البطاقات المسجلة",
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                // Cards List
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cardArr.length,
                  itemBuilder: (context, index) {
                    var cObj = cardArr[index] as Map? ?? {};
                    return _buildCardTile(cObj, index);
                  },
                ),

                const SizedBox(height: 25),

                // Add Card Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RoundIconButton(
                    title: "إضافة بطاقة جديدة",
                    icon: "assets/images/add.png",
                    color: TColor.primary,
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return const AddCardScreen();
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

  Widget _buildPaymentTile({
    required String id,
    required String title,
    required String icon,
  }) {
    return Obx(() {
      bool isSelected = paymentController.selectedMethod.value == id;
      return InkWell(
        onTap: () => paymentController.selectMethod(id),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: TColor.textfield,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? TColor.primary : Colors.transparent,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                icon,
                width: 30,
                height: 30,
                errorBuilder: (c, e, s) => const Icon(Icons.money),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (isSelected) Icon(Icons.check_circle, color: TColor.primary),
            ],
          ),
        ),
      );
    });
  }

  // Helper Widget for Card items
  Widget _buildCardTile(Map cObj, int index) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Image.asset(
              cObj["icon"].toString(),
              width: 40,
              errorBuilder: (c, e, s) => const Icon(Icons.credit_card),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                cObj["card"].toString(),
                style: TextStyle(
                  color: TColor.primaryText,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: 100,
              height: 28,
              child: RoundButton(
                title: 'احذف',
                fontSize: 12,
                onTap: () {},
                type: RoundButtonType.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
