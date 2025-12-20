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
    final size = MediaQuery.of(context).size;
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
              // Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Namaste",
                          style: TextStyle(
                            fontSize: size.width * 0.075,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Welcome back to peace",
                          style: TextStyle(color: AppColors.textLight, fontSize: size.width * 0.045),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.black, size: size.width * 0.065),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: size.height * 0.035),

              // Section title
              Text(
                "Choose Your Chant",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: size.width * 0.050),
              ),

              SizedBox(height: size.height * 0.02),

              // Chant list
              ...chants.map(
                (c) => ChantTile(
                  chant: c,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ChantScreen(chant: c)),
                    );
                  },
                ),
              ),

              SizedBox(height: size.height * 0.02),

              // Quote card
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
