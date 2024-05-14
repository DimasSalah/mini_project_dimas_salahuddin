import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tatrupiah_si/app/modules/ai/controllers/ai_controller.dart';
import 'package:tatrupiah_si/app/modules/home/controllers/home_controller.dart';
import 'package:tatrupiah_si/app/themes/colors.dart';

import '../../../themes/gradient.dart';
import '../../../themes/text_style.dart';
import 'components/bottom_chat.dart';
import 'components/intial_message.dart';

class ChatView extends GetView<AiController> {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ai Chat',
          style: medium.copyWith(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InitialMessage(
                    onChanged: controller.setAmount,
                  ),
                  const SizedBox(height: 4),
                  GetBuilder<AiController>(
                    id: 'chat',
                    builder: (controller) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.conversation.length,
                        itemBuilder: (context, index) {
                          var convo = controller.conversation[index];
                          return Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 23, vertical: 1),
                                alignment: convo.isMe
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: convo.isMe ? normal : light,
                                    borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(15),
                                      topRight: const Radius.circular(15),
                                      bottomLeft: convo.isMe
                                          ? const Radius.circular(15)
                                          : const Radius.circular(0),
                                      bottomRight: convo.isMe
                                          ? const Radius.circular(0)
                                          : const Radius.circular(15),
                                    ),
                                  ),
                                  child: Text(convo.text,
                                      style: regular.copyWith(
                                          fontSize: 14,
                                          color: convo.isMe
                                              ? Colors.white
                                              : dark)),
                                ),
                              ),
                              // create for me avatar and gpt avatar
                              Container(
                                padding: const EdgeInsets.all(4),
                                margin: const EdgeInsets.only(bottom: 8),
                                alignment: convo.isMe
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                decoration: const BoxDecoration(),
                                child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: normal,
                                    child: convo.isMe
                                        ? SvgPicture.string(controller.iconSvg())
                                        : Image.asset('assets/icons/bot.png')),
                              )
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          BottomChat(controller: controller),
        ],
      ),
    );
  }
}
