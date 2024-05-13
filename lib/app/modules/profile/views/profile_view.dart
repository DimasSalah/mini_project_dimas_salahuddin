import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tatrupiah_si/app/themes/colors.dart';
import 'package:tatrupiah_si/app/themes/gradient.dart';
import 'package:tatrupiah_si/app/themes/text_style.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Profil Saya', style: semiBold.copyWith(fontSize: 24)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () => controller.logout(),
              child: Icon(Icons.logout, color: error, size: 25)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: Get.height * 0.45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: normal,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Obx(
                    () => SvgPicture.string(
                      controller.icon.value,
                      fit: BoxFit.fitHeight,
                    ),
                  )),
              const Gap(20),
              Obx(
                () => SizedBox(
                  height: 50,
                  child: TextFormField(
                    initialValue: controller.name.value,
                    onChanged: controller.changeName,
                    autofocus: controller.isEdit.value,
                    readOnly: controller.isEdit.value,
                    style: medium.copyWith(fontSize: 34, color: dark),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const Gap(5),
              Obx(() {
                return controller.isEdit.value
                    ? Row(
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
                                      DateTime.parse(
                                          controller.createdAt.value)),
                                  style: regular.copyWith(
                                    fontSize: 14,
                                    color: dark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.changeEdit();
                            },
                            child: Text(
                              'Batal',
                              style: regular.copyWith(
                                  fontSize: 16, color: lightActive),
                            ),
                          ),
                          const Gap(10),
                          GestureDetector(
                            onTap: () {
                              controller.updateProfile();
                            },
                            child: Text(
                              'Simpan',
                              style: medium.copyWith(
                                  fontSize: 16, color: normal),
                            ),
                          ),
                        ],
                      );
              }),
              const Gap(35),
              Obx(
                () => controller.isEdit.value
                    ? GestureDetector(
                        onTap: () {
                          controller.changeEdit();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 11),
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
                                style: regular.copyWith(
                                    fontSize: 16, color: light),
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
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
