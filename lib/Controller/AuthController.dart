import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_7th_bookhub/Config/Messages.dart';
import 'package:project_7th_bookhub/Screens/HomeScreen/HomeScreen.dart';
import 'package:project_7th_bookhub/Screens/WelcomeScreen/WelcomeScreen.dart';

class AuthController extends GetxController{
  RxBool isLoading = false.obs;
final auth = FirebaseAuth.instance;
  // login // signin function
  void signInWithGoogle() async {
    isLoading.value = true;
    try{
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      successMessage("Sign-in Success");
      Get.offAll(HomeScreen());
    }catch(ex){
      print(ex);
      errorMessage("Something went wrong");    }
  isLoading.value = false;
  }


  void signout() async {
    await auth.signOut();
    successMessage('Signed Out');
    Get.offAll(WelcomeScreen());
  }
}