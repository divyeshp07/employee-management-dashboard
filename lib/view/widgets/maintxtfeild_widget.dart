import 'package:flutter/material.dart';

class MainTxtFeild extends StatelessWidget {
  const MainTxtFeild(
      {super.key,
      required this.controller,
      this.textInputType,
      required this.hinttxt,
      this.obscuretext = false});

  final TextEditingController controller;
  final TextInputType? textInputType;
  final String hinttxt;
  final bool obscuretext;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscuretext,
      decoration: InputDecoration(
        hintText: hinttxt,
        border: OutlineInputBorder(),
      ),
    );
  }
}
