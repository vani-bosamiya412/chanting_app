import 'package:flutter/material.dart';
import '../../models/chant_model.dart';
import '../../services/audio_service.dart';
import '../../services/storage_service.dart';
import '../../services/vibration_service.dart';
import 'chant_counter.dart';
import '../completion/completion_screen.dart';

class ChantScreen extends StatefulWidget {
  final ChantModel chant;

  const ChantScreen({super.key, required this.chant});

  @override
  State<ChantScreen> createState() => _ChantScreenState();
}

class _ChantScreenState extends State<ChantScreen> {
  late int total;
  int count = 0;

  @override
  void initState() {
    super.initState();
    total = StorageService.chantCount;
    VibrationService.enabled = StorageService.vibration;
  }

  void increment() async {
    if (StorageService.sound) await AudioService.playTap();
    VibrationService.tap();

    setState(() => count++);

    if (count == total) {
      if (StorageService.sound) await AudioService.playComplete();
      VibrationService.complete();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => CompletionScreen(total: total),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).size.width * 0.05;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back)),
                  const Spacer(),
                  TextButton(
                    onPressed: () => setState(() => count = 0),
                    child: const Text("Reset"),
                  )
                ],
              ),
              Text(widget.chant.title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600)),
              Text(widget.chant.subtitle),
              const SizedBox(height: 30),
              ChantCounter(current: count, total: total),
              const SizedBox(height: 30),
              FloatingActionButton(
                backgroundColor: widget.chant.color,
                onPressed: increment,
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
