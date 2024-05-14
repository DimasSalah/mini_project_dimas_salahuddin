import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../themes/colors.dart';
import '../../../../themes/gradient.dart';
import '../../../../themes/text_style.dart';
import '../../controllers/ai_controller.dart';


class BottomChat extends StatelessWidget {
  const BottomChat({
    super.key,
    required this.controller,
  });

  final AiController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
        top: 10,
      ),
      height: Get.height * 0.22,
      decoration: BoxDecoration(
        color: white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(color: lighter, width: 1.4),
      ),
      child: Column(
        children: [
          Expanded(
            child: Obx(() {
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 1,
                  childAspectRatio: 7 / 2.8,
                ),
                itemCount: controller.options.length,
                itemBuilder: (context, index) {
                  String option = controller.options[index];
                  return Obx(() {
                    bool isSelected = controller.isSelected(option);
                    return GestureDetector(
                      onTap: () {
                        controller.toggleOption(option);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: isSelected ? normal : lightActive,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            option,
                            style: regular.copyWith(
                                fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  });
                },
              );
            }),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  minLines: 1,
                  maxLines: 2,
                  readOnly: true,
                  controller: controller.textController,
                  style: regular.copyWith(fontSize: 14, color: dark),
                  decoration: InputDecoration(
                    isDense: false,
                    filled: true,
                    fillColor: const Color(0xFFECECEC),
                    hintText: 'Pilih opsi diatas',
                    hintStyle: const TextStyle(
                        color: Color(0xFFC3C3C3),
                        fontWeight: FontWeight.w400),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: lighter, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: lighter, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: error, width: 1),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.sendMessage();
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    gradient: primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.arrow_upward, color: dark),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
