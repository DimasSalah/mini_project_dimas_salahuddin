import 'package:get/get.dart';
import 'package:tatrupiah_si/app/modules/ai/views/ai_view.dart';
import 'package:tatrupiah_si/app/modules/profile/views/profile_view.dart';

import '../../../data/services/user_service.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/views/home_view.dart';

class MainController extends GetxController {

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
    Get.put(HomeController());
    super.onInit();
  }

  RxInt selectedIndex = 0.obs;

  final screen = [
    const HomeView(),
    const AiView(),
    const ProfileView(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

}