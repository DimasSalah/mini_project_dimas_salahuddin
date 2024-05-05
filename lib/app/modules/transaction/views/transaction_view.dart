import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tatrupiah_si/app/themes/text_style.dart';

import '../../../themes/colors.dart';
import '../controllers/transaction_controller.dart';
import 'components/custom_tab_bar.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:  Text('Transaksi',style: regular),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () {
                  return GestureDetector(
                    onTap: () {
                      controller.onChangeTabValue(false);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(
                            color: controller.changeTab.value
                                ? Colors.transparent
                                : darkActive,
                            width: 2,
                          )),
                      child: Text('pendapatan',
                          style: controller.changeTab.value
                              ? regular.copyWith(color: success, fontSize: 14)
                              : semiBold.copyWith(
                                  color: darkHover, fontSize: 14)),
                    ),
                  );
                },
              ),
              const Gap(10),
              Obx(() {
                return GestureDetector(
                  onTap: () {
                    controller.onChangeTabValue(true);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                          color: controller.changeTab.value
                              ? darkActive
                              : transparent,
                          width: 2,
                        )),
                    child: Text('pengeluaran',
                        style: controller.changeTab.value
                            ? semiBold.copyWith(color: darkHover, fontSize: 14)
                            : regular.copyWith(color: error, fontSize: 14)),
                  ),
                );
              })
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Obx(
          () {
            return controller.changeTab.value
                ? CustomTabBar(
                  inputCategory : controller.categoryExpanse,
                )
                //income view
                :  CustomTabBar(
                  inputCategory : controller.categoryIncome,
                );
          },
        ),
      ),
    );
  }
}

