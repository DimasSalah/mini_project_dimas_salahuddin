import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tatrupiah_si/app/utils/currency_format.dart';

import '../../../../themes/colors.dart';
import '../../../../themes/text_style.dart';


class BalanceCard extends StatelessWidget {
  final String title;
  final String icon;
  final Color color;
  final int balance;
  const BalanceCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.balance,
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
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: white.withOpacity(0.2), width: 2),
            ),
            child: SvgPicture.asset(
              icon,width: 32,
            ),
          ),
          const Gap(6.5),
          Text(title,
              style: regular.copyWith(fontSize: 15, color: lighter)),
          Text(
            formatCurrencyShort(balance.toString()),
            style: bold.copyWith(fontSize: 24, color: white),
          ),
        ],
      ),
    );
  }
}
