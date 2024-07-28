import 'package:employee_management_dashboard/controller/auth_controller.dart';
import 'package:employee_management_dashboard/view/widgets/textfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFeildWdget(
              controller: emailController,
              labeltxt: 'Email',
            ),
            TextFeildWdget(
              controller: passwordController,
              labeltxt: 'Password',
              obscuretxt: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authController.signUp(
                    emailController.text, passwordController.text);
              },
              child: const Text("Sign Up"),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/');
              },
              child: const Text("Already have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
