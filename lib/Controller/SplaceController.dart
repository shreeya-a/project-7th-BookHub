import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:project_7th_bookhub/Screens/HomeScreen/HomeScreen.dart';
import 'package:project_7th_bookhub/Screens/WelcomeScreen/WelcomeScreen.dart';

class SplaceController extends GetxController {
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    splaceController();
  }

  void splaceController() {
    Future.delayed(const Duration(seconds: 6), () {
      if (auth.currentUser != null) {
        Get.offAll(() => const HomeScreen());
      } else {
        Get.offAll(() => const WelcomeScreen());

      }

      // }
    });
  }
}
