import 'package:flutter/painting.dart';

extension ExtTextStyle on TextStyle {
  TextStyle withColor(Color? color) {
    return copyWith(color: color);
  }
}
