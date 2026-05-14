import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:proto/widgets/round_textfeild.dart';

import '../common/color_extension.dart';
import '../widgets/round_icon_button.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    TextEditingController txtCardNumber = TextEditingController();
    TextEditingController txtCardMonth = TextEditingController();
    TextEditingController txtCardYear = TextEditingController();
    TextEditingController txtCardCode = TextEditingController();
    TextEditingController txtFirstName = TextEditingController();
    TextEditingController txtLastName = TextEditingController();

    final isToggle = false.obs;

    @override
    void dispose() {
      txtCardNumber.dispose();
      txtCardMonth.dispose();
      txtCardYear.dispose();
      txtCardCode.dispose();
      txtFirstName.dispose();
      txtLastName.dispose();
      super.dispose();
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        width: media.width,
        decoration: BoxDecoration(
          color: TColor.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ضيف بطاقة أئتمان جديدة",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.close, color: TColor.primaryText, size: 25),
                ),
              ],
            ),
            Divider(color: TColor.secondaryText.withOpacity(0.4), height: 1),
            const SizedBox(height: 15),
            RoundTextField(
              controller: txtCardNumber,
              hintText: "رقم الكارت",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Text(
                  "تاريخ الأنتهاء",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 90,
                  child: RoundTextField(
                    hintText: "MM",
                    controller: txtCardMonth,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 25),
                SizedBox(
                  width: 90,
                  child: RoundTextField(
                    hintText: "YYYY",
                    controller: txtCardYear,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),
            RoundTextField(
              hintText: "الرثم السري",
              controller: txtCardCode,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            RoundTextField(hintText: "الأسم الأول", controller: txtFirstName),
            const SizedBox(height: 15),
            RoundTextField(hintText: "الأسم التاني", controller: txtLastName),
            const SizedBox(height: 15),
            Row(
              children: [
                Text(
                  "تقدر تحذف البطاقة دي في أي وقت",
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Obx(
                  () => Switch(
                    value: isToggle.value,
                    activeColor: TColor.primary,
                    onChanged: (newVal) {
                      isToggle.value = newVal;
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),
            RoundIconButton(
              title: "ضيف البطاقة",
              icon: "assets/images/add.png",
              color: TColor.primary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              onTap: () {},
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
