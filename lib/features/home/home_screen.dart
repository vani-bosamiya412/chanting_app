import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../models/chant_model.dart';
import '../chant/chant_screen.dart';
import '../settings/settings_screen.dart';
import 'chant_tile.dart';
import '../../widgets/quote_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = AppSizes.padding(context);

    final chants = [
      ChantModel(
        title: 'Om',
        subtitle: 'Universal Peace',
        icon: Icons.auto_awesome,
        color: Colors.orange,
      ),
      ChantModel(
        title: 'Gayatri Mantra',
        subtitle: 'Divine Illumination',
        icon: Icons.auto_awesome,
        color: Colors.purple,
      ),
      ChantModel(
        title: 'Mahamrityunjaya',
        subtitle: 'Healing & Protection',
        icon: Icons.favorite,
        color: Colors.blue,
      ),
      ChantModel(
        title: 'Shanti Mantra',
        subtitle: 'Inner Calm',
        icon: Icons.self_improvement,
        color: Colors.green,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Namaste",
                      style:
                      TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SettingsScreen()),
                      );
                    },
                  )
                ],
              ),
              const Text("Welcome back to peace",
                  style: TextStyle(color: AppColors.textLight)),
              const SizedBox(height: 20),
              const Text("Choose Your Chant",
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              ...chants.map(
                    (c) => ChantTile(
                  chant: c,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChantScreen(chant: c),
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
              const QuoteCard(
                text:
                '"The mind is everything. What you think you become."\n— Buddha',
              ),
            ],
          ),
        ),
      ),
    );
  }
}