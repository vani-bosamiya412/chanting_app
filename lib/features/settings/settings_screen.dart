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
    chantCount = StorageService.chantCount;
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).size.width * 0.05;

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text("Sound"),
              value: sound,
              onChanged: (v) {
                setState(() => sound = v);
                StorageService.setSound(v);
              },
            ),
            SwitchListTile(
              title: const Text("Vibration"),
              value: vibration,
              onChanged: (v) {
                setState(() => vibration = v);
                StorageService.setVibration(v);
              },
            ),
            const SizedBox(height: 20),
            const Text("Default Chant Count"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [27, 54, 108].map((e) {
                return ChoiceChip(
                  label: Text("$e"),
                  selected: chantCount == e,
                  onSelected: (_) {
                    setState(() => chantCount = e);
                    StorageService.setChantCount(e);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}