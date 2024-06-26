
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../routes/app_pages.dart';
import '../../../../themes/colors.dart';
import '../../../../themes/gradient.dart';
import '../../../../themes/text_style.dart';


class FooterSection extends StatelessWidget {
  const FooterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Kelola Semua Keuanganmu!',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
              style: semiBold.copyWith(fontSize: 20)),
          const SizedBox(height: 6),
          Text(
            'Kendalikan keuangan pribadimu dengan lebih rapi. Siap bertemu dengan angka angka?',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: regular.copyWith(
              fontSize: 14,
              color: lightActive,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 14,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.REGISTER);
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
              decoration: BoxDecoration(
                color: dark,
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 5),
                  Text(
                    'Mulai Sekarang',
                    style: regular.copyWith(fontSize: 16, color: light),
                  ),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      gradient: primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/left_arrow.svg',
                      height: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.LOGIN);
            },
            child: RichText(
              text: TextSpan(
                text: 'Sudah punya akun? ',
                style: regular.copyWith(fontSize: 13, color: lightActive),
                children: [
                  TextSpan(
                    text: 'Masuk',
                    style: regular.copyWith(fontSize: 13, color: darker),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
