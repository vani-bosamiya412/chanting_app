import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ChantCounter extends StatelessWidget {
  final int current;
  final int total;

  const ChantCounter({super.key, required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: w * 0.6,
          width: w * 0.6,
          child: CircularProgressIndicator(
            value: current / total,
            strokeWidth: 8,
            backgroundColor: AppColors.primary.withOpacity(0.2),
            color: AppColors.primary,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$current",
              style:
              const TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
            ),
            Text("/ $total",
                style: const TextStyle(color: AppColors.textLight)),
          ],
        )
      ],
    );
  }
}