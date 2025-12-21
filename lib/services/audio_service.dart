import 'dart:async';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioPlayer _mantraPlayer = AudioPlayer();
  static final AudioPlayer _uiPlayer = AudioPlayer();

  static int _playedCount = 0;
  static int _targetCount = 0;
  static bool _isPaused = false;
  static VoidCallback? _onEachComplete;
  static StreamSubscription? _completionSub;

  static Future<void> playTap() async {
    await _uiPlayer.play(AssetSource('sounds/tap.mp3'));
  }

  static Future<void> playComplete() async {
    await _uiPlayer.play(AssetSource('sounds/complete.mp3'));
  }

  static Future<void> startMantra({
    required String asset,
    required int repeatCount,
    required VoidCallback onEachComplete,
  }) async {
    await stop();

    _playedCount = 0;
    _targetCount = repeatCount;
    _onEachComplete = onEachComplete;
    _isPaused = false;

    _completionSub = _mantraPlayer.onPlayerComplete.listen((_) async {
      if (_isPaused) return;

      _playedCount++;
      _onEachComplete?.call();

      if (_playedCount < _targetCount) {
        await _mantraPlayer.play(AssetSource(asset));
      }
    });

    await _mantraPlayer.play(AssetSource(asset));
  }

  static Future<void> pause() async {
    _isPaused = true;
    await _mantraPlayer.pause();
  }

  static Future<void> resume() async {
    _isPaused = false;
    await _mantraPlayer.resume();
  }

  static Future<void> stop() async {
    _isPaused = false;
    _playedCount = 0;
    _targetCount = 0;

    await _completionSub?.cancel();
    _completionSub = null;

    await _mantraPlayer.stop();
  }

  static bool get isPaused => _isPaused;
}