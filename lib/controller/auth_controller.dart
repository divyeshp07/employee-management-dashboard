import 'package:employee_management_dashboard/service/auth_service.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  var isSignedIn = false.obs;
  User? get user => _authService.getCurrentUser();

  @override
  void onInit() {
    ever(isSignedIn, handleAuthChanged);
    isSignedIn.value = user != null;
    super.onInit();
  }

  void handleAuthChanged(bool isLoggedIn) {
    if (isLoggedIn) {
      Get.testMode = true;
      Get.offAllNamed('/home');
    } else {
      Get.offAllNamed('/');
    }
  }

  void signUp(String email, String password) async {
    try {
      User? user = await _authService.signUp(email, password);
      if (user != null) {
        Get.snackbar("success", "account created successfully",
            snackPosition: SnackPosition.BOTTOM);
        Get.toNamed('/');
      }
    } catch (e) {
      print("signup error$e");
      Get.snackbar("signup error", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signIn(String email, String password) async {
    try {
      User? user = await _authService.signIn(email, password);
      if (user != null) {
        isSignedIn.value = true;
        Get.toNamed('/home');
      }
    } catch (e) {
      print("signin error: $e");
      Get.snackbar("signinerror", "please check your credentials",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    await _authService.signOut();
    isSignedIn.value = false;
  }
}
