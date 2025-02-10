import 'package:credit_hub_app/core/constant/constant.dart';
import 'package:flutter/material.dart';

class ItemAccount extends StatelessWidget {
  final Image imageBank;
  final String textName;
  final String textBank;
  final String textNumberBank;
  final bool isSelected;
  final VoidCallback onSelect;

  const ItemAccount({
    super.key,
    required this.imageBank,
    required this.textName,
    required this.textBank,
    required this.textNumberBank,
    this.isSelected = false,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: GestureDetector(
        onTap: onSelect,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xE2E2E2),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: Colors.grey.withOpacity(0.23),

            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: imageBank,
                  ),
                ),
              ),
              w(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      textBank,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      textNumberBank,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              w(12),
              if (isSelected)
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
