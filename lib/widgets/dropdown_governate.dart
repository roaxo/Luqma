import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proto/common/color_extension.dart';

class DropdownGovernate extends StatelessWidget {
  DropdownGovernate({super.key});
  @override

  final List<String> egyptGovernorates = [
    "القاهرة", "الجيزة", "الإسكندرية", "الدقهلية", "البحر الأحمر", "البحيرة",
    "الفيوم", "الغربية", "الإسماعيلية", "المنوفية", "المنيا", "القليوبية",
    "الوادي الجديد", "السويس", "الشرقية", "سوهاج", "جنوب سيناء", "شمال سيناء",
    "قنا", "كفر الشيخ", "مطروح", "الأقصر", "أسوان", "أسيوط", "بني سويف",
    "بورسعيد", "دمياط",
  ];

  final selectedGovern = "".obs;
  
  Widget build(BuildContext context) {
    return Obx(
      () => Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
            color: TColor.textfield,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: selectedGovern.value.isNotEmpty
                  ? TColor.primary
                  : Colors.transparent,
              width: 1.2,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              menuMaxHeight: 300,
              borderRadius: BorderRadius.circular(20),
              dropdownColor: TColor.textfield,
              icon: Icon(Icons.keyboard_arrow_down, color: TColor.placeholder),
              value: selectedGovern.value == "" ? null : selectedGovern.value,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              hint: Text(
                "اختر المحافظة",
                style: TextStyle(color: TColor.placeholder, fontSize: 14),
              ),
              items: egyptGovernorates.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  alignment: AlignmentDirectional
                      .centerStart, // Aligns text to the right for RTL
                  child: Text(
                  value,
                    style: TextStyle(color: TColor.primaryText, fontSize: 15),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                selectedGovern.value = newValue ?? "";
              },
            ),
          ),
        ),
      ),
    );
  }
}
