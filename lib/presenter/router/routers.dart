import 'package:flutter/widgets.dart';

import '../view/onboarding/intro/intro_view.dart';
import '../view/onboarding/sign_up/sign_up_view.dart';

class Routers {
  static const intro = "intro";
  static const signUp = "sign_up";

  static Map<String, Widget Function()> get map => {
    intro: () => const IntroView(),
    signUp: () => const SignUpView(),
  };
}