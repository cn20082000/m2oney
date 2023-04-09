import 'package:flutter/widgets.dart';

import '../view/onboarding/intro/intro_view.dart';
import '../view/onboarding/sign_up/sign_up_view.dart';
import '../view/onboarding/verification/verification_view.dart';

class Routers {
  static const intro = "intro";
  static const signUp = "sign_up";
  static const verification = "verification";

  static Map<String, Widget Function()> get map => {
    intro: () => const IntroView(),
    signUp: () => const SignUpView(),
    verification: () => const VerificationView(),
  };
}