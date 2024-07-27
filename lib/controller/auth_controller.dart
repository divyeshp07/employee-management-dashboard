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
      Get.offAllNamed('/home');
    } else {
      Get.offAllNamed('/');
    }
  }

  void signUp(String email, String password) async {
    try {
      User? user = await _authService.signUp(email, password);
      if (user != null) {
        isSignedIn.value = true;
      }
      Get.snackbar('account created', 'success');
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
  }

  void signIn(String email, String password) async {
    try {
      User? user = await _authService.signIn(email, password);
      if (user != null) {
        isSignedIn.value = true;
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
  }

  void signOut() async {
    await _authService.signOut();
    isSignedIn.value = false;
  }
}
