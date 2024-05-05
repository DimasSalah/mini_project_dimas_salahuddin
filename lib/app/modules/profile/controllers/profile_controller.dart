import 'package:get/get.dart';

import '../../../data/services/user_service.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

   RxString name = ''.obs;

  void checkLogin () async {
    final userService = UserService();
    await userService.getUser().then((value) {
      name.value = value.name;
    });
  }

  @override
  void onInit() {
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

}
