import 'package:employee_management_dashboard/controller/auth_controller.dart';
import 'package:employee_management_dashboard/view/widgets/maintxtfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController emailController =
      TextEditingController(text: 'debs@gmail.com');
  final TextEditingController passwordController =
      TextEditingController(text: 'debs@123');

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return desktopLayout(context);
              } else if (constraints.maxWidth > 600) {
                return tabletLayout(context);
              } else {
                return mobileLayout(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget desktopLayout(BuildContext context) {
    return Container(
      width: 800,
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.white12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        color: Colors.grey[900],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hey!',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyanAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome back, please login to your account.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login to Your Account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyanAccent,
                  ),
                ),
                const SizedBox(height: 20),
                MainTxtFeild(
                  controller: emailController,
                  hinttxt: 'Email',
                ),
                const SizedBox(height: 20),
                MainTxtFeild(
                  controller: passwordController,
                  hinttxt: 'Password',
                  obscuretext: true,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    authController.signIn(
                        emailController.text, passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text("Login"),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/signup');
                  },
                  child: const Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(color: Colors.cyanAccent),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tabletLayout(BuildContext context) {
    return Container(
      width: 600,
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.white12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        color: Colors.grey[900],
      ),
      child: Column(
        children: [
          const Text(
            'Hey!',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.cyanAccent,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Welcome back, please login to your account.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Login to Your Account',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.cyanAccent,
            ),
          ),
          const SizedBox(height: 20),
          MainTxtFeild(
            controller: emailController,
            hinttxt: 'Email',
          ),
          const SizedBox(height: 20),
          MainTxtFeild(
            controller: passwordController,
            hinttxt: 'Password',
            obscuretext: true,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              authController.signIn(
                  emailController.text, passwordController.text);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: const Text("Login"),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Get.toNamed('/signup');
            },
            child: const Text(
              "Don't have an account? Sign up",
              style: TextStyle(color: Colors.cyanAccent),
            ),
          ),
        ],
      ),
    );
  }

  Widget mobileLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hey!',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.cyanAccent,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Welcome back, please login to your account.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Login to Your Account',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.cyanAccent,
            ),
          ),
          const SizedBox(height: 20),
          MainTxtFeild(
            controller: emailController,
            hinttxt: 'Email',
          ),
          const SizedBox(height: 20),
          MainTxtFeild(
            controller: passwordController,
            hinttxt: 'Password',
            obscuretext: true,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              authController.signIn(
                  emailController.text, passwordController.text);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: const Text("Login"),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Get.toNamed('/signup');
            },
            child: const Text(
              "Don't have an account? Sign up",
              style: TextStyle(color: Colors.cyanAccent),
            ),
          ),
        ],
      ),
    );
  }
}
