import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatrupiah_si/app/themes/colors.dart';
import 'package:tatrupiah_si/app/themes/text_style.dart';
import '../../controllers/transaction_controller.dart';

class NumButton extends StatelessWidget {
  final int number;
  const NumButton({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    TransactionController controller = Get.find<TransactionController>();
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: transparent,
      child: InkWell(
        onTap: () {
          if (controller.enteredValue.value.length < 9) {
            controller.onEnterValue(controller.enteredValue.value + number.toString());
          }
        },
        borderRadius: BorderRadius.circular(50),
        splashColor: lightActive,
        child: Ink(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: light,
          ),
          child: Text(
            number.toString(),
            style: semiBold.copyWith(fontSize: 24, color: dark),
          ),
        ),
      ),
    );
  }
}
