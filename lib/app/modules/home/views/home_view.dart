import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tatrupiah_si/app/themes/colors.dart';

import '../../../themes/gradient.dart';
import '../../../themes/text_style.dart';
import '../controllers/home_controller.dart';
import 'components/balance_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 64,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CircleAvatar(
            radius: 26,
            backgroundColor: lighter,
          ),
        ),
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
      body: Column(
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
                BalanceCard(
                  title: 'Pendapatan',
                  icon: 'assets/icons/expanse.svg',
                  color: success,
                ),
                const Gap(8),
                BalanceCard(
                  title: 'Pengeluaran',
                  icon: 'assets/icons/income.svg',
                  color: error,
                ),
              ],
            ),
          ),
          const Gap(6),
          //bottom section
          Expanded(
            child: Container(
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
                      SvgPicture.asset(
                        'assets/icons/calendar.svg',
                      ),
                    ],
                  ),
                  const Gap(14),
                  Container(
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
                              'assets/icons/fooddrink.svg',
                              width: 30,
                            ),
                          ),
                        ),
                        const Gap(8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Makan',
                              style: medium.copyWith(fontSize: 16, color: dark),
                            ),
                            Gap(2),
                            Text(
                              'Nasi Goreng',
                              style: regular.copyWith(
                                  fontSize: 14, color: lightActive),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          'Rp 20.000',
                          style: bold.copyWith(fontSize: 22, color: error),
                        ),
                        const Gap(8),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: SizedBox(
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
            onPressed: () {},
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
      ),
    );
  }
}
