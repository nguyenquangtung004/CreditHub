import 'package:flutter/material.dart';

import '../core/constant/app_color.dart';
import 'app_theme.dart';

class CustomTheme {
  CustomTheme();

  ThemeData? oneAppTheme;

  factory CustomTheme.fromContext(BuildContext context) {
    final CustomTheme theme = CustomTheme();

    theme.oneAppTheme = ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'RobotoFlex',
      textTheme: TextTheme(
        bodyMedium: AppTheme.of(context).body2,
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        height: 56.0,
        buttonColor: AppColors.primary,
      ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.transparent, brightness: Brightness.light).copyWith(background: Colors.white),
    );

    return theme;
  }
}