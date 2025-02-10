import 'package:flutter/material.dart';

final Map<String, LinearGradient> statusGradients = {
  "Chờ quyết toán": LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFD001),
      Color(0xFFFFC727),
    ],
  ),
  "Không quyết toán": LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFF754A),
      Color(0xFFFF4A4A),
    ],
  ),
  "Đã quyết toán": LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF4BF56C),
      Color(0xFF1AC53B),
    ],
  ),
};


class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF0171BB);
  static const Color primary1 = Color(0xFF007DD0);

  //base color
  static const Color red = Color(0xFFF2323F);
  static const Color red2 = Color(0xFFFF5D56);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color green = Color(0xFF20BA26);
  static const Color green2 = Color(0xFFA7D200);
  static const Color green3 = Color(0xFFEFFFF0);
  static const Color blue = Color(0xFF3AC2EA);

  //Text Colors
  static const Color line = Color(0xFFCBCBCB);
  static const Color grey1 = Color(0xFF595959);
  static const Color grey2 = Color(0xFF8F8F8F);
  static const Color grey3 = Color(0xFFD9D9D9);
  static const Color background = Color(0xFFF7F7F7);
  static const Color textGrey1 = Color(0xFF615F5F);
  static const Color textGrey2 = Color(0xFFB2B2B2);
  static const Color textGrey3 = Color(0xFF3E3B3B);
  static const Color textGrey4 = Color(0xFF616161);
  static const Color textGrey5 = Color(0xFFE0E0E0);
  static const Color textGreyDark = Color(0xFF050505);
  static const Color whiteBackground = Color(0xFFF2FBF1);
  static const Color greyLight = Color(0xFFF3F3F5);
  static const Color bgTextField = Color(0xFFF4FAF7);

  static const LinearGradient gradient = LinearGradient(
    colors: [Color(0xFFF1C200), Color(0xFF0E9006)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}