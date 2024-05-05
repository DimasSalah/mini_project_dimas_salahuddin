import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tatrupiah_si/app/modules/transaction/views/components/calendar_of_week.dart';

import '../../../../themes/colors.dart';
import '../../../../themes/text_style.dart';
import '../../../../utils/currency_format.dart';
import '../../controllers/transaction_controller.dart';
import 'number_button.dart';

class CustomTabBar extends StatelessWidget {
  final Map inputCategory;
  const CustomTabBar({
    super.key,
    required this.inputCategory,
  });

  @override
  Widget build(BuildContext context) {
    TransactionController controller = Get.find<TransactionController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalendarOfWeek(
          onChangedSelectedDate: (date) {
            controller.onEnterDate(date);
          },
        ),
        const Gap(10),
        Stack(
          children: [
            SizedBox(
                width: double.infinity,
                child: Obx(() {
                  return TextFormField(
                    controller: TextEditingController(
                      text: formatCurrency(controller.enteredValue.value),
                    ),
                    textAlign: TextAlign.center,
                    readOnly: true,
                    style: regular.copyWith(fontSize: 40),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: transparent,
                        ),
                      ),
                      isDense: true,
                      constraints: const BoxConstraints(
                        maxHeight: 80,
                      ),
                    ),
                  );
                })),
            Positioned(
              right: 0,
              bottom: 0,
              top: 0,
              child: GestureDetector(
                onTap: () {
                  if (controller.enteredValue.value.isNotEmpty) {
                    controller.enteredValue.value = controller
                        .enteredValue.value
                        .substring(0, controller.enteredValue.value.length - 1);
                  }
                },
                child: Icon(
                  Icons.backspace,
                  color: dark,
                  size: 24,
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.dialog(
                  AlertDialog(
                    scrollable: true,
                    backgroundColor: transparent,
                    surfaceTintColor: white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(40),
                      side: BorderSide(
                          color: white,
                          width: 2), 
                    ),
                    title: Text(
                      'Pilih Kategori',
                      style: semiBold.copyWith(fontSize: 22, color: white),
                    ),
                    content: Container(
                      width: Get.width * 0.8,
                      height: controller.changeTab.value
                          ? Get.height * 0.4
                          : Get.height * 0.35,
                      padding: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: inputCategory.length,
                        itemBuilder: (context, index) {
                          final key = inputCategory.keys.elementAt(index);
                          final value = inputCategory[key];
                          return ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(7),
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: darkActive,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: SvgPicture.asset(
                                value!,
                              ),
                            ),
                            title: Text(key),
                            onTap: () {
                              controller.onChangeCategoryValue(value);
                              Get.back();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                width: 50,
                padding: const EdgeInsets.all(12),
                height: 50,
                decoration: BoxDecoration(
                  color: darkActive,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Obx(
                  () => SvgPicture.asset(
                    controller.categoryValue.value == ''
                        ? inputCategory.values.elementAt(0)
                        : controller.categoryValue.value,
                  ),
                ),
              ),
            ),
            const Gap(10),
            //catatan
            SizedBox(
              width: Get.width * 0.5,
              child: TextFormField(
                // onTap: () => controller.visibleNumberPad(true),
                // onTapOutside: (event) {
                //   FocusScope.of(context).unfocus();
                //   controller.visibleNumberPad(false);
                // },
                controller: controller.note,
                style: regular.copyWith(fontSize: 14, color: light),
                decoration: InputDecoration(
                  fillColor: dark,
                  filled: true,
                  hintText: 'catatan',
                  hintStyle: regular.copyWith(
                    fontSize: 14,
                    color: light,
                  ),
                  alignLabelWithHint: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: darkActive, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: darkActive, width: 1),
                  ),
                  isDense: true,
                  constraints: const BoxConstraints(
                    maxHeight: 50,
                  ),
                ),
              ),
            )
          ],
        ),
        const Gap(30),
        //number pad
        Column(
          children: [
            for (var i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (index) => NumButton(number: 1 + 3 * i + index),
                  ).toList(),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const NumButton(number: 0),
                  InkWell(
                    onTap: () {
                      controller.enteredValue.value += '00';
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
                        '00',
                        style: semiBold.copyWith(fontSize: 24, color: dark),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.submitIncome();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(24.5),
                      decoration: BoxDecoration(
                        color: darkActive,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.check,
                        color: white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
