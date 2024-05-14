import 'package:get/get.dart';
import 'package:tatrupiah_si/app/modules/ai/controllers/ai_controller.dart';
import 'package:tatrupiah_si/app/modules/ai/views/ai_view.dart';
import 'package:tatrupiah_si/app/modules/profile/controllers/profile_controller.dart';
import 'package:tatrupiah_si/app/modules/profile/views/profile_view.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/views/home_view.dart';

class MainController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final count = 0.obs;
  
  @override
  void onInit() async {
    Get.put(HomeController());
    Get.put(ProfileController());
    Get.put(AiController());
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
