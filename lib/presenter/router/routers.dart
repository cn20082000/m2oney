import 'package:flutter/widgets.dart';

import '../view/onboarding/forgot_password/forgot_password_view.dart';
import '../view/onboarding/forgot_password_sent/forgot_password_sent_view.dart';
import '../view/onboarding/intro/intro_view.dart';
import '../view/onboarding/login/login_view.dart';
import '../view/onboarding/setup_pin/setup_pin_view.dart';
import '../view/onboarding/sign_up/sign_up_view.dart';
import '../view/onboarding/verification/verification_view.dart';

class Routers {
  static const intro = "intro";
  static const signUp = "sign_up";
  static const verification = "verification";
  static const login = "login";
  static const forgotPassword = "forgot_password";
  static const forgotPasswordSent = "forgot_password_sent";
  static const setupPin = "setup_pin";

  static Map<String, Widget Function()> get map => {
    intro: () => const IntroView(),
    signUp: () => const SignUpView(),
    verification: () => const VerificationView(),
    login: () => const LoginView(),
    forgotPassword: () => const ForgotPasswordView(),
    forgotPasswordSent: () => const ForgotPasswordSentView(),
    setupPin: () => const SetupPinView(),
  };
}