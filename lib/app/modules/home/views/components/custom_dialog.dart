
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../themes/colors.dart';
import '../../../../themes/text_style.dart';

class CustomDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const CustomDialog({
    super.key,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Hapus Transaksi',
        textAlign: TextAlign.center,
        style: semiBold.copyWith(fontSize: 22),
      ),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Apakah anda yakin ingin menghapus transaksi ini?',
              style: regular.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    child: Text(
                      'Batal',
                      style: medium.copyWith(fontSize: 13, color: normal),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onConfirm,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: dark,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Hapus',
                      style: medium.copyWith(fontSize: 13, color: lighter),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
