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
  bool isPlaying = false;
  bool isPaused = false;

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

      case 'Om Namah Shivay':
        return 'ॐ नमः शिवाय';

      case 'Shanti Mantra':
        return 'ॐ शान्तिः शान्तिः शान्तिः';

      default:
        return '';
    }
  }

  void pauseChanting() async {
    await AudioService.pause();
    setState(() => isPaused = true);
  }

  void resumeChanting() async {
    await AudioService.resume();
    setState(() => isPaused = false);
  }

  @override
  void dispose() {
    AudioService.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.06;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Spacer(),
                    TextButton.icon(
                      onPressed: () => setState(() => count = 0),
                      icon: Icon(Icons.refresh, size: 18),
                      label: Text("Reset"),
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.02),

                Text(
                  widget.chant.title,
                  style: TextStyle(
                    fontSize: size.width * 0.065,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  widget.chant.subtitle,
                  style: TextStyle(
                    fontSize: size.width * 0.038,
                    color: Colors.black54,
                  ),
                ),

                SizedBox(height: size.height * 0.05),

                ChantCounter(current: count, total: total),

                SizedBox(height: size.height * 0.035),

                if (StorageService.vibration)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.vibration,
                        size: 18,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "Vibration enabled",
                        style: TextStyle(
                          fontSize: size.width * 0.035,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),

                Spacer(),

                IconButton(
                  iconSize: size.width * 0.09,
                  icon: Icon(
                    isPlaying ? Icons.pause_circle : Icons.play_circle,
                    color: Colors.black87,
                  ),
                  onPressed: () async {
                    if (!isPlaying) {
                      if (count == 0) {
                        await AudioService.startMantra(
                          asset: widget.chant.audio,
                          repeatCount: total,
                          onEachComplete: () {
                            if (!mounted) return;

                            setState(() => count++);

                            if (count == total) {
                              AudioService.playComplete();
                              VibrationService.complete();

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CompletionScreen(total: total),
                                ),
                              );
                            }
                          },
                        );
                      } else {
                        await AudioService.resume();
                      }

                      setState(() => isPlaying = true);
                    } else {
                      await AudioService.pause();
                      setState(() => isPlaying = false);
                    }
                  },
                ),

                Spacer(),

                GestureDetector(
                  onTap: increment,
                  child: Container(
                    width: size.width * 0.25,
                    height: size.width * 0.25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFF9800),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 12,
                          offset: Offset(0, 6),
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