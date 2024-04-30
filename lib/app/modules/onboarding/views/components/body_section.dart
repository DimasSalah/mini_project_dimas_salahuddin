import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../themes/colors.dart';
import '../../controllers/onboarding_controller.dart';


class BodySection extends StatelessWidget {
  const BodySection({
    super.key,
    required this.controller,
  });

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.54,
      width: double.infinity,
      decoration: BoxDecoration(
        color: white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          CarouselSlider(
              carouselController: controller.carouselController,
              items: [
                Image.asset(
                  'assets/images/onboarding1.png',
                  height: 300,
                ),
                Image.asset(
                  'assets/images/onboarding2.png',
                  height: 300,
                ),
                Image.asset(
                  'assets/images/onboarding3.png',
                  height: 300,
                ),
              ],
              options: CarouselOptions(
                height: 400.0,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  controller.currentCarouselIndex.value = index;
                },
              )),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: controller.currentCarouselIndex.value == i
                          ? normal.withOpacity(0.5)
                          : lightActive.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
