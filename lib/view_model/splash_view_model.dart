import 'package:get/get.dart';
import 'package:music_app/view/main_tabview/main_tabview.dart';

class SplashViewModel extends GetxController {
  // @override
  // onInit() {
  //   loadScreen();
  //   super.onInit();
  // }

  Future<void> loadScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll(() => const MainTabview());
  }
}
