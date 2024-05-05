import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ai_controller.dart';

class AiView extends GetView<AiController> {
  const AiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
