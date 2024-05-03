import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../themes/colors.dart';
import '../../../../themes/text_style.dart';


class BalanceCard extends StatelessWidget {
  final String title;
  final String icon;
  final Color color;
  const BalanceCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.45,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: dark,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
          ),
          Gap(6.5),
          Text(title,
              style: regular.copyWith(fontSize: 15, color: white)),
          Text(
            'Rp 0',
            style: bold.copyWith(fontSize: 24, color: color),
          ),
        ],
      ),
    );
  }
}
