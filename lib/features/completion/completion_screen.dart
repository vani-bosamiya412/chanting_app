import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../home/home_screen.dart';

class CompletionScreen extends StatelessWidget {
  final int total;

  const CompletionScreen({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.completionGradient),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Success icon
                Container(
                  height: size.width * 0.28,
                  width: size.width * 0.28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 56,
                    color: AppColors.success,
                  ),
                ),

                SizedBox(height: size.height * 0.04),

                /// Title
                Text(
                  "Chant Completed",
                  style: TextStyle(fontSize: size.width * 0.09, fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 8),

                /// Subtitle
                Text(
                  "Well done! You completed Om",
                  style: TextStyle(fontSize: size.width * 0.04, color: Colors.black54),
                ),

                SizedBox(height: size.height * 0.04),

                /// Total chants card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.035),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "$total",
                        style: TextStyle(
                          fontSize: size.width * 0.12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Total Chants",
                        style: TextStyle(fontSize: size.width * 0.045, color: Colors.black54),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                /// Decorative icons row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.auto_awesome, color: Colors.orange),
                    SizedBox(width: 12),
                    Icon(Icons.local_florist, color: Colors.orange),
                    SizedBox(width: 12),
                    Icon(Icons.auto_awesome, color: Colors.orange),
                  ],
                ),

                SizedBox(height: size.height * 0.03),

                /// Quote card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.025,
                    horizontal: size.width * 0.04,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDFF8EA),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    '"Peace comes from within. Do not seek it without."',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: size.width * 0.045, fontStyle: FontStyle.italic),
                  ),
                ),

                SizedBox(height: size.height * 0.05),

                /// Chant again button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF9800),
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                        (_) => false,
                      );
                    },
                    child: Text(
                      "Chant Again",
                      style: TextStyle(
                        fontSize: size.width * 0.045,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.015),

                // Back to home
                SizedBox(
                  width: double.infinity,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                              (_) => false,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.02,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.arrow_back,
                              color: Colors.black87,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Back to Home",
                              style: TextStyle(
                                fontSize: size.width * 0.045,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}