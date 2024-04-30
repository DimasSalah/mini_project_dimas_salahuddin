import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../themes/colors.dart';
import '../controllers/onboarding_controller.dart';
import 'components/body_section.dart';
import 'components/footer_section.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: darker,
      appBar: AppBar(
        backgroundColor: white,
        toolbarHeight: 90,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 20),
            child: Image.asset(
              'assets/images/logo.png',
              height: 70,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          BodySection(controller: controller),
          const SizedBox(
            height: 4,
          ),
          const FooterSection(),
        ],
      ),
    );
  }
}
