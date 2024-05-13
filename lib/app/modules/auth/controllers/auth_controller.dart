import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tatrupiah_si/app/data/services/auth_service.dart';
import 'package:tatrupiah_si/app/data/services/image_service.dart';
import 'package:tatrupiah_si/app/routes/app_pages.dart';
import 'package:tatrupiah_si/app/themes/colors.dart';

class AuthController extends GetxController {
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString icon = ''.obs;
  RxBool isLoading = false.obs;
  RxBool obscureText = true.obs;

  final formKey = GlobalKey<FormState>();

  validateName(String? name) {
    if (name!.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    return null;
  }

  validateEmail(String? email) {
    if (email != null && !GetUtils.isEmail(email)) {
      return 'Email tidak valid';
    }
    return null;
  }

  validatePassword(String? pwd) {
    if (pwd!.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  void setName(String value) {
    name.value = value;
  }

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  // Future<void> login() async {
  //   final authService = AuthService();
  //   await authService.login(name.value, password.value);
  // }

  // Future<void> register() async {
  //   final authService = AuthService();
  //   await authService.register(name.value, password.value);
  // }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      final imageService = ImageService();
      final authService = AuthService();
      final iconResult = await imageService.imageUrl(name.value);
      try {
        final response =
            await authService.registerAuth(email.value, password.value);
        if (response.statusCode == 200) {
          final id = response.data['user']['id'];
          GetStorage().write('id', id);
          icon.value = iconResult.data.toString();
          await authService.registerUser(id, name.value, icon.value);
          Get.offAllNamed(Routes.MAIN);
        }
      } catch (e) {
        Get.snackbar(
          'Error',
          'Email sudah terdaftar',
          backgroundColor: light.withOpacity(0.5),
          colorText: error,
        );
      }
      isLoading.value = false;
    } else {
      Get.snackbar(
        'Error',
        'Form tidak valid',
        backgroundColor: light.withOpacity(0.5),
        colorText: error,
      );
    }
  }

  Future<void> login() async {
    final authService = AuthService();
    await authService.loginAuth(email.value, password.value);
  }
}
