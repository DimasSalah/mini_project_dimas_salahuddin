import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:tatrupiah_si/app/data/services/transaction_service.dart';
import 'package:tatrupiah_si/app/modules/home/views/components/transaction_card.dart';
import 'package:tatrupiah_si/app/themes/colors.dart';
import '../../../themes/text_style.dart';
import '../../main/controllers/main_controller.dart';
import '../controllers/home_controller.dart';
import 'components/balance_card.dart';
import 'components/custom_dialog.dart';
import 'components/floating_button.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    controller;
    final mainController = Get.put(MainController());
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 64,
        leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CircleAvatar(
              backgroundColor: lightHover,
              child: ClipOval(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Obx(
                    () => mainController.icon.value == ''
                        ? Icon(Icons.person, size: 30, color: dark)
                        : SvgPicture.string(
                            mainController.icon.value,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            )),
        title: Text(DateFormat('E, MMM dd').format(DateTime.now()),
            style: medium.copyWith(fontSize: 24)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              'assets/icons/setting.svg',
              width: 32,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //top section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(
                    () => BalanceCard(
                      title: 'Pendapatan',
                      icon: 'assets/icons/expanse.svg',
                      color: success,
                      balance: controller.totalIncome.value,
                    ),
                  ),
                  const Gap(8),
                  Obx(
                    () => BalanceCard(
                      title: 'Pengeluaran',
                      icon: 'assets/icons/income.svg',
                      color: error,
                      balance: controller.totalExpense.value,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(6),
            //bottom section
            Container(
              constraints: BoxConstraints(
                minHeight: Get.height * 0.58,
              ),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transaksi',
                        style: semiBold.copyWith(fontSize: 22),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: controller.firstTimeDay.value,
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2050),
                          );
                          if (selectedDate != null) {
                            controller.selectedDate(selectedDate);
                          }
                        },
                        child: SvgPicture.asset(
                          'assets/icons/calendar.svg',
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => Text(
                      DateFormat('EEEE, dd MMM')
                          .format(controller.firstTimeDay.value),
                      style: regular.copyWith(fontSize: 16, color: lightActive),
                    ),
                  ),
                  const Gap(14),
                  GetBuilder<HomeController>(
                    id: 'transaction',
                    builder: (controller) {
                      return FutureBuilder(
                        future: TransactionService().getTransactions(
                          DateFormat('yyyy-MM-dd')
                              .format(controller.firstTimeDay.value),
                          DateFormat('yyyy-MM-dd')
                              .format(controller.lastTimeDay.value),
                        ),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: Column(
                                children: [
                                  const Gap(50),
                                  Lottie.asset(
                                    'assets/animations/loading.json',
                                    width: 300,
                                    height: 300,
                                    repeat: true,
                                  ),
                                ],
                              ),
                            );
                          } else if (controller.transactions.isEmpty) {
                            return Center(
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/empty.svg',
                                    width: 200,
                                  ),
                                  const Gap(20),
                                  Text(
                                    'Kosong',
                                    style: semiBold.copyWith(fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'Kamu belum menambahkan laporan keuangan pada tanggal ini',
                                    style: regular.copyWith(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.transactions.length,
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  confirmDismiss: (direction) async {
                                    if (direction ==
                                            DismissDirection.endToStart ||
                                        direction ==
                                            DismissDirection.startToEnd) {
                                      Get.dialog(
                                        CustomDialog(
                                          onConfirm: () async {
                                            await TransactionService()
                                                .deleteTransaction(controller
                                                    .transactions[index].id);
                                            controller.transactions
                                                .removeAt(index);
                                            Get.back();
                                            controller.updateTransaction();
                                          },
                                        ),
                                      );
                                    }
                                    return null;
                                  },
                                  background: Container(
                                      padding: const EdgeInsets.only(left: 20),
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                          color: error.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Icon(
                                        Icons.delete,
                                        color: error,
                                        size: 30,
                                      )),
                                  key: ValueKey(controller.transactions[index]),
                                  child: TransactionCard(
                                    icon:
                                        controller.transactions[index].iconPath,
                                    category:
                                        controller.transactions[index].category,
                                    note: controller.transactions[index].note,
                                    amount: controller
                                                .transactions[index].income ==
                                            0
                                        ? controller.transactions[index].expanse
                                        : controller.transactions[index].income,
                                    color:
                                        controller.transactions[index].income ==
                                                0
                                            ? error
                                            : success,
                                  ),
                                );
                              },
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingButton(),
    );
  }
}
