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

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => CompletionScreen(total: total)),
      );
    }
  }

  String _getMantraText() {
    switch (widget.chant.title) {
      case 'Om':
        return 'ॐ';

      case 'Gayatri Mantra':
        return 'ॐ भूर्भुवः स्वः तत्सवितुर्वरेण्यं भर्गो देवस्य धीमहि\n'
            'धियो यो नः प्रचोदयात्';

      case 'Mahamrityunjaya':
        return 'ॐ त्र्यम्बकं यजामहे सुगन्धिं पुष्टिवर्धनम्\n'
            'उर्वारुकमिव बन्धनान् मृत्योर्मुक्षीय मामृतात्\n';

      case 'Shanti Mantra':
        return 'ॐ शान्तिः शान्तिः शान्तिः';

      default:
        return '';
    }
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
            colors: [Color(0xFFF6EEFF), Color(0xFFFFF4DC)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              children: [
                // Top bar
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    TextButton.icon(
                      onPressed: () => setState(() => count = 0),
                      icon: const Icon(Icons.refresh, size: 18),
                      label: const Text("Reset"),
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.02),

                // Title
                Text(
                  widget.chant.title,
                  style: TextStyle(
                    fontSize: size.width * 0.065,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  widget.chant.subtitle,
                  style: TextStyle(
                    fontSize: size.width * 0.038,
                    color: Colors.black54,
                  ),
                ),

                SizedBox(height: size.height * 0.05),

                // Counter
                ChantCounter(current: count, total: total),

                SizedBox(height: size.height * 0.035),

                // Vibration status
                if (StorageService.vibration)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.vibration,
                        size: 18,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "Vibration enabled",
                        style: TextStyle(
                          fontSize: size.width * 0.035,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),

                const Spacer(),

                // Increment button
                GestureDetector(
                  onTap: increment,
                  child: Container(
                    width: size.width * 0.25,
                    height: size.width * 0.25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFFF9800),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        width: size.width * 0.09,
                        height: size.width * 0.09,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: size.width * 0.07,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.04),

                // Bottom mantra card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.022),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _getMantraText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.width * 0.055,
                      fontWeight: FontWeight.w500,
                      height: 1.6,
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