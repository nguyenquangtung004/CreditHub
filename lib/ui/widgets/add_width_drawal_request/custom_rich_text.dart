import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String textTitle;
  final String textTitle01;
  const CustomRichText(
      {super.key, required this.textTitle, required this.textTitle01});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: textTitle,
        style: TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: textTitle01,
            style: TextStyle(
              color: Colors.red
            )
          )
        ]

      ),
    );
  }
}
