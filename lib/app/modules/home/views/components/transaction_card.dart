import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:tatrupiah_si/app/utils/currency_format.dart';

import '../../../../themes/colors.dart';
import '../../../../themes/text_style.dart';

class TransactionCard extends StatelessWidget {
  final String icon;
  final String category;
  final String note;
  final int amount;
  final Color color;
  const TransactionCard({
    super.key,
    required this.icon,
    required this.category,
    required this.note,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: light,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: darker,
                borderRadius: BorderRadius.circular(50),
              ),
              child: SvgPicture.asset(
                icon,
                width: 30,
              ),
            ),
          ),
          const Gap(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: medium.copyWith(fontSize: 16, color: dark),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Gap(2),
              Text(
                note,
                style: regular.copyWith(fontSize: 14, color: lightActive),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const Spacer(),
          Text(
            formatCurrency(amount.toString()),
            style: semiBold.copyWith(fontSize: 20, color: color),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(8),
        ],
      ),
    );
  }
}
