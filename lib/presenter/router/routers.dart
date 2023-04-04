import 'package:flutter/widgets.dart';

import '../view/onboarding/intro/intro_view.dart';

class Routers {
  static const intro = "intro";

  static Map<String, Widget Function(BuildContext)> get map => {
    intro: (_) => const IntroView(),
  };
}