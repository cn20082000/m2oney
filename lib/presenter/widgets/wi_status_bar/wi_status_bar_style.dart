import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/app_colors.dart';

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

  Color? get titleColor {
    switch (this) {
      case WiStatusBarStyle.light:
        return AppColors.dark50;
      case WiStatusBarStyle.dark:
        return AppColors.light100;
      default:
        return null;
    }
  }

  SystemUiOverlayStyle? get systemUiOverlayStyle {
    if (this == WiStatusBarStyle.light || this == WiStatusBarStyle.dark) {
      return SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: statusBarBrightness,
        statusBarIconBrightness: statusBarIconBrightness,
      );
    }
    return null;
  }
}
