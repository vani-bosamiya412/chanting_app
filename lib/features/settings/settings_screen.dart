import 'package:flutter/material.dart';
import '../../services/storage_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool sound;
  late bool vibration;
  late int chantCount;

  @override
  void initState() {
    super.initState();
    sound = StorageService.sound;
    vibration = StorageService.vibration;
    chantCount = StorageService.chantCount; // default = 108
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.06;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFF6E5), Color(0xFFFFFBF3)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.03),

                /// Sound card
                _settingsTile(
                  context,
                  icon: Icons.volume_up,
                  iconColor: Colors.orange,
                  title: "Sound",
                  subtitle: "Play completion sound",
                  trailing: Switch(
                    value: sound,
                    onChanged: (v) {
                      setState(() => sound = v);
                      StorageService.setSound(v);
                    },
                  ),
                ),

                SizedBox(height: size.height * 0.02),

                /// Vibration card
                _settingsTile(
                  context,
                  icon: Icons.vibration,
                  iconColor: Colors.purple,
                  title: "Vibration",
                  subtitle: "Haptic feedback on tap",
                  trailing: Switch(
                    value: vibration,
                    onChanged: (v) {
                      setState(() => vibration = v);
                      StorageService.setVibration(v);
                    },
                  ),
                ),

                SizedBox(height: size.height * 0.02),

                /// Default chant count card
                Container(
                  padding: EdgeInsets.all(size.width * 0.045),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Default Chant Count",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: size.width * 0.04),
                      ),
                      SizedBox(height: size.height * 0.005),
                      Text(
                        "Select your preferred count",
                        style: TextStyle(color: Colors.black54, height: 1.5, fontSize: size.width * 0.035),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        children: [27, 54, 108].map((e) {
                          final isSelected = chantCount == e;
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.01,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() => chantCount = e);
                                  StorageService.setChantCount(e);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.014,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? const Color(0xFFFF9800)
                                        : const Color(0xFFF2F2F2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    "$e",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: size.width * 0.035,
                                      height: 1.5,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                // About card
                Container(
                  padding: EdgeInsets.all(size.width * 0.05),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF1C9),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Mala Beads",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: size.width * 0.04),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        "Traditional mala beads have 108 beads. "
                        "The number 108 holds spiritual significance in many Eastern traditions. "
                        "You can also practice with 27 (1/4 mala) or 54 (1/2 mala) repetitions.",
                        style: TextStyle(color: Colors.black87, height: 1.5, fontSize: size.width * 0.035),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.04,),

                // Footer
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Chantify v1.0",
                        style: TextStyle(color: Colors.black54, fontSize: size.width * 0.035),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Find peace through daily practice",
                        style: TextStyle(color: Colors.black45, fontSize: size.width * 0.035),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Reusable settings tile
  Widget _settingsTile(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required Widget trailing,
  }) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(size.width * 0.045),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          Container(
            height: size.width * 0.12,
            width: size.width * 0.12,
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(width: size.width * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}