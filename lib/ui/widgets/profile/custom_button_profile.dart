import 'package:credit_hub_app/core/constant/constant.dart';
import 'package:flutter/material.dart';

class CustomBottomProfile extends StatelessWidget {
  final String text_button_profile;
  final VoidCallback onPressed;
  final IconData icon;
  const CustomBottomProfile(
      {super.key,
      required this.text_button_profile,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      child: ElevatedButton(
        
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            w(20),
            Icon(
              icon,
              color: Color.fromRGBO(247, 95, 80, 1),
            ),
            w(10),
            Text(
              text_button_profile,
              style: const TextStyle(
                  color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
            w(20),
           
          ],
        ),
      ),
    );
  }
}
