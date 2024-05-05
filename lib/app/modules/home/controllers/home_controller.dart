import 'package:get/get.dart';
import 'package:tatrupiah_si/app/data/services/user_service.dart';

class HomeController extends GetxController {
  RxString name = ''.obs;

  void checkLogin () async {
    final userService = UserService();
    await userService.getUser().then((value) {
      name.value = value.name;
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
    checkLogin();
    super.onInit();
  }

  @override
  void onReady() {
    
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
