import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'wi_status_bar_style.dart';

class WiStatusBar extends StatelessWidget {
  final Widget child;
  final WiStatusBarStyle style;

  const WiStatusBar({
    Key? key,
    required this.child,
    this.style = WiStatusBarStyle.auto,
  }) : super(key: key);

  factory WiStatusBar.light({
    Key? key,
    required Widget child,
  }) =>
      WiStatusBar(
        key: key,
        style: WiStatusBarStyle.light,
        child: child,
      );

  factory WiStatusBar.dark({
    Key? key,
    required Widget child,
  }) =>
      WiStatusBar(
        key: key,
        style: WiStatusBarStyle.dark,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: style.statusBarBrightness,
        statusBarIconBrightness: style.statusBarIconBrightness,
      ),
      child: child,
    );
  }

  static get lightStyle => SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: WiStatusBarStyle.light.statusBarBrightness,
    statusBarIconBrightness: WiStatusBarStyle.light.statusBarIconBrightness,
  );

  static get darkStyle => SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: WiStatusBarStyle.dark.statusBarBrightness,
    statusBarIconBrightness: WiStatusBarStyle.dark.statusBarIconBrightness,
  );
}
