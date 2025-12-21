import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: AppColors.background,
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: AppColors.textDark),
    ),
  );
}