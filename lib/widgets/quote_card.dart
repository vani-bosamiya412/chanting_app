import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class QuoteCard extends StatelessWidget {
  final String text;

  const QuoteCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.06,
        vertical: size.height * 0.03,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF1CF),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.textDark,
          fontSize: size.width * 0.038,
          height: 1.5,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}