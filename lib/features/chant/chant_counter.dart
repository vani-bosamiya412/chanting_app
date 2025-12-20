import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ChantCounter extends StatelessWidget {
  final int current;
  final int total;

  const ChantCounter({super.key, required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final circleSize = size.width * 0.68;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Full light ring
        SizedBox(
          height: circleSize,
          width: circleSize,
          child: CircularProgressIndicator(
            value: 1,
            strokeWidth: 12,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation(
              AppColors.primary.withValues(alpha: 0.15),
            ),
          ),
        ),

        // Small orange progress arc
        SizedBox(
          height: circleSize,
          width: circleSize,
          child: CircularProgressIndicator(
            value: current / total,
            strokeWidth: 12,
            backgroundColor: Colors.transparent,
            valueColor: const AlwaysStoppedAnimation(Color(0xFFFF9800)),
          ),
        ),

        // Counter text
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$current",
              style: TextStyle(
                fontSize: size.width * 0.18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              "/ $total",
              style: TextStyle(
                fontSize: size.width * 0.05,
                color: AppColors.textLight,
              ),
            ),
          ],
        ),
      ],
    );
  }
}