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
    final size = MediaQuery.of(context).size;
    final radius = AppSizes.radius(context);

    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.015),
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.018,
          ),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon container
              Container(
                height: size.width * 0.12,
                width: size.width * 0.12,
                decoration: BoxDecoration(
                  color: chant.color,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  chant.icon,
                  color: Colors.white,
                  size: size.width * 0.06,
                ),
              ),

              SizedBox(width: size.width * 0.04),

              // Texts
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chant.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.045,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      chant.subtitle,
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: size.width * 0.035,
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(Icons.chevron_right, color: Colors.black45),
            ],
          ),
        ),
      ),
    );
  }
}