
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../themes/colors.dart';
import '../../../../themes/gradient.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74,
      width: 84,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 20),
        child: FloatingActionButton(
          splashColor: darker,
          backgroundColor: dark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 0,
          onPressed: () {
            Get.toNamed(Routes.TRANSACTION);
          },
          child: Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                gradient: primary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: SvgPicture.asset(
                'assets/icons/plus.svg',
              )),
        ),
      ),
    );
  }
}
