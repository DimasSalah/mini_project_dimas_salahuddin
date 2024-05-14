import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../themes/colors.dart';
import '../../../../themes/text_style.dart';
import '../../../../utils/currency_format.dart';
import '../../../home/controllers/home_controller.dart';

class InitialMessage extends StatelessWidget {
  final void Function(String) onChanged;
  const InitialMessage({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.only(left: 23, right: 23, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: light,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Text(
              'Ayo, biarkan aku membantumu mengalokasikan anggaran dengan maksimal, menggunakan opsi dibawah!',
              style: regular.copyWith(fontSize: 13),
              textAlign: TextAlign.left,
            ),
          ),
          const Gap(4),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: light,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ingin digunakan untuk apa saja uang sebesar',
                  style: regular.copyWith(fontSize: 13),
                ),
                TextFormField(
                  onChanged: onChanged,
                  initialValue: formatCurrency(
                      homeController.totalIncome.value.toString()),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      suffixIcon: const Icon(Icons.create),
                      suffixIconConstraints:
                          const BoxConstraints(maxWidth: 30, maxHeight: 30),
                      hintStyle: regular.copyWith(fontSize: 14, color: dark),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      constraints: BoxConstraints(
                          maxWidth: Get.width * 0.4, maxHeight: 30)),
                )
              ],
            ),
          ),
          const Gap(6),
          CircleAvatar(
            radius: 20,
            backgroundColor: normal,
            child: Image.asset('assets/icons/bot.png'),
          ),
        ],
      ),
    );
  }
}
