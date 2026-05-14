import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:proto/common/color_extension.dart';

class OffersCarousel extends StatefulWidget {
  const OffersCarousel({super.key});

  @override
  State<OffersCarousel> createState() => _OffersCarouselState();
}

class _OffersCarouselState extends State<OffersCarousel> {
  final List<String> images = [
    "assets/images/offer_1.jpg",
    "assets/images/offer_2.jpeg",
    "assets/images/offer_3.jpeg",
  ];

  RxInt current = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          items: images
              .map(
                (item) => Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(item),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            // height: 250,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              current.value = index; // Fixed assignment
            },
            aspectRatio: 16 / 9,
          ),
        ),
        const SizedBox(height: 16),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.asMap().entries.map((entry) {
              return Container(
                width: 9.0,
                height: 9.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: current.value == entry.key
                      ? TColor.primary
                      : TColor.placeholder,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
