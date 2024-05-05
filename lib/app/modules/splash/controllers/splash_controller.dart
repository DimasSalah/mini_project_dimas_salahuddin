import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tatrupiah_si/app/routes/app_pages.dart';

class SplashController extends GetxController {
  RxInt count = 0.obs;
  void checkLogin() async {
    final getId = await GetStorage().read('id');
    Future.delayed(const Duration(seconds: 2), () {
      if (getId == null || getId == 0) {
        Get.offNamed(Routes.ONBOARDING);
      } else {
        count.value = getId;
        Get.offNamed(Routes.MAIN);
      }
    });
  }

  @override
  void onReady() {
    checkLogin();
    super.onReady();
  }
}
