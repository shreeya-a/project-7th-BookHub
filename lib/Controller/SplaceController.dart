import 'package:get/get.dart';
import 'package:project_7th_bookhub/Screens/WelcomeScreen/WelcomeScreen.dart';

class SplaceController extends GetxController {
  // final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    // splaceController();
    Future.delayed(const Duration(seconds: 4), () {
      Get.offAll(() => const WelcomeScreen());
    });
  }

  // void splaceController() {
  //   Future.delayed(const Duration(seconds: 4), () {
  //     // if (auth.currentUser != null) {
  //     //   Get.offAll(HomePage());
  //     // } else {
  //     //   Get.offAll(WelcomeScreen());
  //     Get.offAll(() => const WelcomeScreen());
  //     // }
  //   });
  // }
}
