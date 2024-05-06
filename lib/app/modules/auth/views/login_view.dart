import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:tatrupiah_si/app/modules/auth/views/components/custom_form.dart';
import 'package:tatrupiah_si/app/themes/colors.dart';
import 'package:tatrupiah_si/app/themes/text_style.dart';

import '../../../routes/app_pages.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 23, right: 23, top: 70, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ayo Masuk!',
                    style: semiBold.copyWith(fontSize: 25),
                  ),
                  const Gap(7),
                  Text(
                    'Lanjutkan Perjalananmu! Siap untuk Bermain dengan Angka-angka?',
                    style: medium.copyWith(fontSize: 16, color: lightActive),
                  ),
                  const Gap(30),
                  Center(
                    child: SvgPicture.asset('assets/icons/login.svg'),
                  ),
                  const Gap(30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomForm(
                        title: 'Email',
                        onChanged: controller.setName,
                      ),
                      const Gap(10),
                      CustomForm(
                        title: 'Password',
                        onChanged: controller.setPassword,
                      ),
                      const Gap(4),
                      Text(
                        'Lupa Password?',
                        style: medium.copyWith(fontSize: 14, color: normal),
                      ),
                    ],
                  ),
                  const Gap(14),
                  GestureDetector(
                    onTap: () {
                      controller.login();
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 24),
                      decoration: BoxDecoration(
                        color: dark,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Masuk',
                        style: regular.copyWith(fontSize: 16, color: white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum punya akun? ',
                    style: medium.copyWith(fontSize: 14, color: lightActive),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offNamed(Routes.REGISTER);
                    },
                    child: Text(
                      'Daftar',
                      style: medium.copyWith(fontSize: 14, color: dark),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
