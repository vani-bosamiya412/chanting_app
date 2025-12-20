import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../home/home_screen.dart';

class CompletionScreen extends StatelessWidget {
  final int total;

  const CompletionScreen({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration:
        const BoxDecoration(gradient: AppColors.completionGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: Icon(Icons.check, size: 40, color: AppColors.success),
            ),
            const SizedBox(height: 20),
            const Text("Chant Completed",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            Container(
              width: w * 0.6,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text("$total",
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.w600)),
                  const Text("Total Chants"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                      (_) => false,
                );
              },
              child: const Text("Back to Home"),
            )
          ],
        ),
      ),
    );
  }
}