import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static SharedPreferences? _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get vibration => _prefs?.getBool('vibration') ?? true;
  static bool get sound => _prefs?.getBool('sound') ?? true;
  static int get chantCount => _prefs?.getInt('chantCount') ?? 27;

  static Future setVibration(bool v) async =>
      await _prefs?.setBool('vibration', v);

  static Future setSound(bool v) async =>
      await _prefs?.setBool('sound', v);

  static Future setChantCount(int v) async =>
      await _prefs?.setInt('chantCount', v);
}