import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tatrupiah_si/app/modules/main/controllers/main_controller.dart';
import 'package:tatrupiah_si/app/themes/colors.dart';
import 'package:tatrupiah_si/app/themes/gradient.dart';
import 'package:tatrupiah_si/app/themes/text_style.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.45,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: normal, borderRadius: BorderRadius.circular(24)),
            ),
            const Gap(20),
            Obx(
              () => Text(
                mainController.name.value,
                style: medium.copyWith(
                  fontSize: 36,
                  color: dark,
                ),
              ),
            ),
            const Gap(5),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    gradient: primary,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/time.svg',
                    height: 18,
                  ),
                ),
                const Gap(10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Bergabung ',
                        style: regular.copyWith(
                          fontSize: 14,
                          color: lightActive,
                        ),
                      ),
                      TextSpan(
                        text: DateFormat('dd MMMM yyyy').format(
                            DateTime.parse(mainController.createdAt.value)),
                        style: regular.copyWith(
                          fontSize: 14,
                          color: dark,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(35),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                decoration: BoxDecoration(
                  color: dark,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 5),
                    Text(
                      'ubah profil',
                      style: regular.copyWith(fontSize: 16, color: light),
                    ),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        gradient: primary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/pencil.svg',
                        height: 22,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
