import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/services/image_service.dart';
import '../../../data/services/user_service.dart';
import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  RxBool isEdit = true.obs;
  RxString name = ''.obs;
  RxString icon = ''.obs;
  RxString createdAt = ''.obs;

  void getUSer() async {
    final userService = UserService();
    await userService.getUser().then((value) {
      name.value = value.name;
      icon.value = value.icon;
      createdAt.value = value.createdAt;
    });
  }
  

  void changeName(String value) {
    name.value = value;
  }

  Future<void> updateProfile() async {
    print(name.value);
    final userService = UserService();
    final imageService = ImageService();
    final iconSvg = await imageService.imageUrl(name.value);
    icon.value = iconSvg.data.toString();
    await userService.updateUser(name.value, icon.value);
    isEdit.value = !isEdit.value;
    Get.back();
  }

  void logout() {
    GetStorage().erase();
    Get.offAllNamed(Routes.ONBOARDING);
  }

  void changeEdit() {
    isEdit.value = !isEdit.value;
  }

  @override
  void onInit() {
    getUSer();
    super.onInit();
  }

}
