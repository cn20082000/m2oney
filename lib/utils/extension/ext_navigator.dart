import 'package:flutter/widgets.dart';

extension ExtNavigator on NavigatorState {
  void popToNamed(String routeName) {
    popUntil((route) => route.settings.name == routeName);
  }

  void pushNamedAndRemoveAll(String routeName) {
    pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}
