import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../themes/colors.dart';
import '../../../themes/text_style.dart';
import '../controllers/auth_controller.dart';
import 'components/custom_form.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 23, right: 23, top: 70, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ayo Daftar!',
                  style: semiBold.copyWith(fontSize: 25),
                ),
                const Gap(7),
                Text(
                  'Catat laporan keuanganmu dengan Sedikit Sentuhan Kreatifitas!',
                  style: medium.copyWith(fontSize: 16, color: lightActive),
                ),
                const Gap(30),
                Center(
                  child: SvgPicture.asset('assets/icons/register.svg'),
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
                    const Gap(6),
                  ],
                ),
                const Gap(14),
                GestureDetector(
                  onTap: () {
                    controller.register();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                    decoration: BoxDecoration(
                      color: dark,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Daftar',
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
                  'Sudah punya akun?',
                  style: medium.copyWith(fontSize: 14, color: lightActive),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: Text(
                    ' Masuk Sini',
                    style: medium.copyWith(fontSize: 14, color: dark),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}