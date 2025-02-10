import 'package:flutter/material.dart';

class CustomButtonSignIn extends StatelessWidget {
  final VoidCallback onPressed;
  final String text01;
  final String text02;
  final Color color01;
  final Color color02;
  final Color backgroundColor;
  const CustomButtonSignIn({
    super.key,
    required this.onPressed,
    required this.text01,
    required this.text02,
    required this.color01,
    required this.color02,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 46, 79, 132).withOpacity(0.2),
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        padding: const EdgeInsets.all(9.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text01,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: color01,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              text02,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: color02,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}