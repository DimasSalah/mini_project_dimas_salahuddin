import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../themes/colors.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: Obx(
        () => ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
          child: NavigationBar(
            height: 70,
            indicatorShape: const CircleBorder(),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            backgroundColor: darkActive,
            surfaceTintColor: error,
            indicatorColor: Colors.transparent,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations:  [
              NavigationDestination(
                icon: SvgPicture.asset('assets/icons/home_outline.svg'),
                selectedIcon: SvgPicture.asset('assets/icons/home_fill.svg'),
                label: 'Home',
              ),
              NavigationDestination(
                icon: SvgPicture.asset('assets/icons/chat_outline.svg'),
                selectedIcon: SvgPicture.asset('assets/icons/chat_fill.svg'),
                label: 'Chat',
              ),
              NavigationDestination(
                icon: SvgPicture.asset('assets/icons/user_fill.svg'),
                selectedIcon: SvgPicture.asset('assets/icons/user_outline.svg'),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}
