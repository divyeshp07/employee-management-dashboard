import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailControllerRe = TextEditingController();
  final TextEditingController passwordControllerRe = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailControllerRe,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordControllerRe,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO:
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
