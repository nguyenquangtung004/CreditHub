import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class DottedBorderBox extends StatelessWidget {
  const DottedBorderBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DottedBorder(
        color: Colors.grey, // Màu của viền đứt đoạn
        strokeWidth: 1.5, // Độ dày viền
        dashPattern: [6, 4], // Độ dài nét đứt và khoảng trống
        borderType: BorderType.RRect, // Bo góc cho hộp
        radius: const Radius.circular(10), // Bán kính bo góc
        child: Container(
          height: 150, // Chiều cao hộp
          width: 300, // Chiều rộng hộp
          color: Colors.grey.shade200, // Màu nền bên trong hộp
          child: const Center(
            child: Icon(
              Icons.camera_alt_outlined,
              color: Colors.grey,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
