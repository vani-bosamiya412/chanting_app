import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../models/chant_model.dart';

class ChantTile extends StatelessWidget {
  final ChantModel chant;
  final VoidCallback onTap;

  const ChantTile({super.key, required this.chant, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final radius = AppSizes.radius(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Row(
            children: [
              Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: chant.color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(chant.icon, color: Colors.white),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(chant.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600)),
                    Text(chant.subtitle,
                        style: const TextStyle(
                            color: AppColors.textLight)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}