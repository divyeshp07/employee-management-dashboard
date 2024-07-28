import 'package:flutter/material.dart';

class TextFeildWdget extends StatelessWidget {
  final TextEditingController controller;
  final String labeltxt;
  final bool? obscuretxt;

  const TextFeildWdget({
    super.key,
    required this.controller,
    required this.labeltxt,
    this.obscuretxt = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: labeltxt),
      obscureText: obscuretxt!,
    );
  }
}
