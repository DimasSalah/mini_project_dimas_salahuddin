import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tatrupiah_si/app/data/services/auth_service.dart';
import 'package:tatrupiah_si/app/data/services/image_service.dart';
import 'package:tatrupiah_si/app/themes/colors.dart';
import 'package:tatrupiah_si/app/themes/text_style.dart';

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

  Future<void> login() async {
    final authService = AuthService();
    await authService.login(name.value, password.value);
  }

  // Future<void> register() async {
  //   final authService = AuthService();
  //   await authService.register(name.value, password.value);
  // }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      Get.snackbar(
        'Succes',
        'Berhasil membuat user',
        backgroundColor: light.withOpacity(0.5),
        colorText: success,
      );
    } else {
      Get.snackbar(
        'Error',
        'Form tidak valid',
        backgroundColor: light.withOpacity(0.5),
        colorText: error,
      );
    }

    isLoading.value = true;
    final supabase = Supabase.instance.client;
    final imageService = ImageService();
    final authService = AuthService();
    await supabase.auth.signUp(
      email: email.value,
      password: password.value,
    );
    final userId = supabase.auth.currentSession!.user.id;
    final iconResult = await imageService.imageUrl(name.value);
    icon.value = iconResult.data.toString();
    await authService.register(userId, name.value, icon.value);
    isLoading.value = false;
  }
}
