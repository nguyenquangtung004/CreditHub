import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), // Viền mặc định màu xám
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey, width: 0.5), // Viền khi không focus
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey, width: 2), // Viền khi được chọn
        ),
      ),
    );
  }
}
