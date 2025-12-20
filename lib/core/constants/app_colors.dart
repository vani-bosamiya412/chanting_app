import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFFFFF7E8);
  static const card = Colors.white;

  static const primary = Color(0xFFFF9800);
  static const accent = Color(0xFF7B61FF);

  static const textDark = Color(0xFF1F2937);
  static const textLight = Color(0xFF6B7280);

  static const success = Color(0xFF22C55E);

  static const splashGradient = LinearGradient(
    colors: [Color(0xFFFFF1D6), Color(0xFFF6EDFF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const completionGradient = LinearGradient(
    colors: [Color(0xFFE7FFF4), Color(0xFFEFFFFF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
