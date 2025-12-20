import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class QuoteCard extends StatelessWidget {
  final String text;

  const QuoteCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEEC4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColors.textDark),
      ),
    );
  }
}