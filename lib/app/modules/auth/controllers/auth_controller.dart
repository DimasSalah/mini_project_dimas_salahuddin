import 'package:get/get.dart';
import 'package:tatrupiah_si/app/data/services/auth_service.dart';

class AuthController extends GetxController {
  RxString name = ''.obs;
  RxString password = ''.obs;

  void setName(String value) {
    name.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  Future<void> login() async {
    final authService = AuthService();
    await authService.login(name.value, password.value);
  }

  Future<void> register() async {
    final authService = AuthService();
    await authService.register(name.value, password.value);
  }
}
