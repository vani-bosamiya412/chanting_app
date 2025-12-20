import '../core/utils/vibration_helper.dart';

class VibrationService {
  static bool enabled = true;

  static void tap() {
    if (enabled) VibrationHelper.light();
  }

  static void complete() {
    if (enabled) VibrationHelper.success();
  }
}
