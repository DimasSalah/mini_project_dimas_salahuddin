import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tatrupiah_si/app/themes/colors.dart';
import 'package:tatrupiah_si/app/themes/text_style.dart';

import '../../../routes/app_pages.dart';
import '../controllers/ai_controller.dart';

class AiView extends GetView<AiController> {
  const AiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            key: const Key('ai_assistent'),
            'Ai Assistent',style: medium.copyWith(fontSize: 24),),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: Get.height * 0.5,
                decoration: BoxDecoration(
                  color: light,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: lightActive),
                ),
                child: Lottie.asset(
                  'assets/animations/bot.json',
                  frameRate: FrameRate.max,
                  repeat: true,
                ),
              ),
              const Gap(14),
              Text(
                key: Key('title'),
                'Permudah penataan keuanganmu dengan bantuan Ai',
                style: semiBold.copyWith(fontSize: 20, color: dark),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                key: Key('description'),
                'Rasakan pengalaman baru dengan AI untuk mengelola dana secara efisien dan hemat waktu.',
                style: regular.copyWith(fontSize: 14, color: lightActive),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(10),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.CHAT),
                child: Container(
                  key: const Key('button'),
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: dark,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    key: const Key('text_button'),
                    'Mulai Obrolan',
                    style: medium.copyWith(fontSize: 16, color: light),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
