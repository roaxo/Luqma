import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:proto/widgets/round_icon_button.dart';
import '../common/color_extension.dart';
import 'my_order_screen.dart';

class MenuItemDetailScreen extends StatelessWidget {
  const MenuItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final quantity = 1.obs;
    final price = 150.obs;
    final isFav = false.obs;
    final selectedSize = ''.obs;
    final selectedIngredients = ''.obs;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: TColor.white,
        body: Stack(
          children: [
            // 1. Top Image
            Image.asset(
              "assets/images/detail_top.png",
              width: media.width,
              fit: BoxFit.contain,
            ),

            // 2. Dark Gradient Overlay
            Container(
              width: media.width,
              height: media.height * 0.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.9),
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            // 3. Content
            SingleChildScrollView(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      SizedBox(height: media.height * 0.4),
                      Container(
                        width: media.width,
                        decoration: BoxDecoration(
                          color: TColor.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Item Name
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                "بيتزا تشيكن تاندوري",
                                style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Rating Row
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IgnorePointer(
                                        ignoring: true,
                                        child: RatingBar.builder(
                                          initialRating: 4,
                                          direction: Axis.horizontal,
                                          itemCount: 5,
                                          itemSize: 18,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: TColor.primary,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "تقييم 4 نجوم",
                                        style: TextStyle(
                                          color: TColor.primary,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${price.toStringAsFixed(2)} ج.م",
                                        style: TextStyle(
                                          color: TColor.primaryText,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        "للقطعة الواحدة",
                                        style: TextStyle(
                                          color: TColor.secondaryText,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            // ايه ده؟
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                "ايه ده؟",
                                style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            // description text
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                "لو ليك في طعم التوابل الهندية الأصيلة.عبارة عن قطع فراخ متبلة تتبيلة تاندوري مع صلصة طماطم غنية وجبنة سايحة غرقانة على الوش.",
                                style: TextStyle(
                                  color: TColor.secondaryText,
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            Divider(
                              color: TColor.secondaryText.withValues(
                                alpha: 0.4,
                              ),
                              height: 1,
                            ),

                            const SizedBox(height: 20),

                            //اختار على مزاجك
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                "اختار على مزاجك",
                                style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),

                            const SizedBox(height: 15),

                            // Size Dropdown
                            dropdownSection(" الحجم", [
                              "كبير",
                              "وسط",
                              "صغير",
                            ], selectedSize),
                            const SizedBox(height: 20),

                            // ingredients Dropdown
                            dropdownSection(" المكونات", [
                              "جبنة موزاريلا",
                              "بابروني",
                              "وصلصة باربكيو",
                            ], selectedIngredients),
                            const SizedBox(height: 30),

                            // Quantity Row
                            Obx(
                              () => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "الكمية",
                                      style: TextStyle(
                                        color: TColor.primaryText,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Spacer(),
                                    quantityButton("+", () => quantity.value++),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      height: 30,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: TColor.primary,
                                        ),
                                      ),
                                      child: Text(
                                        "${quantity.value}",
                                        style: TextStyle(
                                          color: TColor.primary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    quantityButton("-", () {
                                      if (quantity.value > 1) quantity.value--;
                                    }),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            SizedBox(
                              height: 225,
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  //orange thing on the right
                                  Positioned(
                                    child: Container(
                                      width: media.width * 0.27,
                                      height: media.height * 0.65,
                                      decoration: BoxDecoration(
                                        color: TColor.primary,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(35),
                                          bottomLeft: Radius.circular(35),
                                        ),
                                      ),
                                    ),
                                  ),

                                  //white box with total price and add to cart button
                                  Center(
                                    child: Stack(
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 8,
                                            bottom: 8,
                                            left: 20,
                                            right: 20,
                                          ),
                                          width: 300,
                                          height: 130,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(35),
                                              topRight: Radius.circular(35),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 7,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "المحموع الكلي",
                                                style: TextStyle(
                                                  color: TColor.primaryText,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Obx(
                                                () => Text(
                                                  "${(price * quantity.value).toStringAsFixed(1)} ج.م",
                                                  style: TextStyle(
                                                    color: TColor.primaryText,
                                                    fontSize: 21,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              SizedBox(
                                                height: 28,
                                                width: 160,
                                                child: RoundIconButton(
                                                  title: "ضيف الى العربة",
                                                  fontSize: 13,
                                                  icon:
                                                      "assets/images/shopping_add.png",
                                                  color: TColor.primary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        //shopping cart button
                                        Container(
                                          width: 38,
                                          height: 38,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              22.5,
                                            ),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 4,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          ),

                                          alignment: Alignment.center,
                                          child: IconButton(
                                            onPressed: () {
                                              Get.to(() => MyOrderScreen());
                                            },
                                            icon: Icon(
                                              Icons.shopping_cart_sharp,
                                              color: TColor.primary,
                                              size: 28,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  //fav button
                  Container(
                    height: media.height * 0.45,
                    alignment: Alignment.bottomLeft,
                    margin: const EdgeInsets.only(right: 4),
                    child: InkWell(
                      onTap: () {
                        isFav.value = !isFav.value;
                      },
                      child: Obx(
                        () => Image.asset(
                          isFav.value
                              ? "assets/images/favorites_btn.png"
                              : "assets/images/favorites_btn_2.png",
                          width: 75,
                          height: 75,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 4. Top Navigation Bar
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(() => MyOrderScreen());
                      },
                      icon: Icon(Icons.shopping_cart, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dropdownSection(
    String hint,
    List<String> items,
    RxString selectedValue,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: TColor.textfield,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: selectedValue.value.isEmpty
                  ? Colors.transparent
                  : TColor.primary,
              width: 1.5,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: selectedValue.value.isEmpty ? null : selectedValue.value,
              items: items.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: TextStyle(color: TColor.primaryText, fontSize: 14),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                if (newValue != null) {
                  selectedValue.value = newValue;
                }
              },
              hint: Text(
                hint,
                style: TextStyle(color: TColor.secondaryText, fontSize: 14),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget quantityButton(String label, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 35,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: TColor.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
