import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final _player = AudioPlayer();

  static Future<void> playTap() async {
    await _player.play(AssetSource('sounds/tap.mp3'));
  }

  static Future<void> playComplete() async {
    await _player.play(AssetSource('sounds/complete.mp3'));
  }
}