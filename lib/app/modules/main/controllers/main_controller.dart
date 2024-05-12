import 'package:get/get.dart';
import 'package:tatrupiah_si/app/modules/ai/views/ai_view.dart';
import 'package:tatrupiah_si/app/modules/profile/views/profile_view.dart';
import '../../../data/services/user_service.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/views/home_view.dart';

class MainController extends GetxController {
  RxString name = ''.obs;
  RxString icon = ''.obs;
  RxInt selectedIndex = 0.obs;
  RxString createdAt = ''.obs;

  void checkLogin() async {
    final userService = UserService();
    await userService.getUser().then((value) {
      name.value = value.name;
      icon.value = value.icon;
      createdAt.value = value.createdAt;
    });
  }

  

  final count = 0.obs;
  @override
  void onInit() async {
    checkLogin();
    Get.put(HomeController());
    super.onInit();
  }

  final screen = [
    const HomeView(),
    const AiView(),
    const ProfileView(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
