import 'dart:io';
import 'dart:ui';

enum WiStatusBarStyle {
  light,
  dark,
  auto;

  Brightness? get statusBarBrightness {
    if (Platform.isIOS) {
      switch (this) {
        case WiStatusBarStyle.light:
          return Brightness.light;
        case WiStatusBarStyle.dark:
          return Brightness.dark;
        default:
          break;
      }
    }
    return null;
  }

  Brightness? get statusBarIconBrightness {
    if (Platform.isAndroid) {
      switch (this) {
        case WiStatusBarStyle.light:
          return Brightness.dark;
        case WiStatusBarStyle.dark:
          return Brightness.light;
        default:
          break;
      }
    }
    return null;
  }
}
