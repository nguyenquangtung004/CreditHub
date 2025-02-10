import 'package:flutter/material.dart';

class DropdownItem extends StatelessWidget {
  final String textTitleBank;
  final String textSubTitleBank;
  final String imageBank;
  final bool isSelected;

  const DropdownItem({
    super.key,
   required this.textTitleBank, required this.textSubTitleBank, required this.imageBank, required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo ngân hàng
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Image.asset(
              imageBank,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 16),
          // Tên và mô tả ngân hàng
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textTitleBank,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  textSubTitleBank,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Dấu kiểm nếu được chọn
          if (isSelected)
            const Icon(
              Icons.check_circle,
              color: Colors.blue,
              size: 24,
            ),
        ],
      ),
    );
  }
}
