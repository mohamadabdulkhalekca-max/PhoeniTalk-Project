import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthTextField extends StatelessWidget {
  AuthTextField({
    super.key,
    required this.label,
    required this.controller,
    this.icon,
    this.isObscure = false,
  });
  final String label;
  final TextEditingController controller;
  bool isObscure = false;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        prefixIcon: icon,
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
