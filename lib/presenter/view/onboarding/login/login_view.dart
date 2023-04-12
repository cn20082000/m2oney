import 'package:cn_structure/cn_structure.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:m2oney/utils/extension/ext.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_typos.dart';
import '../../../router/routers.dart';
import '../../../widgets/wi_app_bar/wi_app_bar.dart';
import '../../../widgets/wi_button/wi_button.dart';
import '../../../widgets/wi_text_field/wi_text_field.dart';
import 'login_notifier.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends CnState<LoginView, LoginNotifier> {
  @override
  LoginNotifier get constructor => LoginNotifier();

  @override
  Widget widgetBuild(BuildContext context) {
    return Scaffold(
      appBar: WiAppBar(
        title: "Login",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 56,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildInputs(),
              const SizedBox(height: 40),
              _buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputs() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          WiTextField(
            autoFocus: true,
            focusNode: notifier.emailNode,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => notifier.passwordNode.requestFocus(),
          ),
          const SizedBox(height: 24),
          WiTextField(
            focusNode: notifier.passwordNode,
            obscureText: true,
            hintText: "Password",
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => debugPrint("Tap: Login"),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          Hero(
            tag: "MainButton",
            child: WiButton.primary(
              content: "Login",
              onPressed: () => debugPrint("Tap: Login"),
            ),
          ),
          const SizedBox(height: 32),
          Text.rich(
            TextSpan(
              text: "Forgot Password?",
              style: AppTypos.title3.withColor(
                AppColors.violet100,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap =
                    () => Navigator.pushNamed(context, Routers.forgotPassword),
            ),
          ),
          const SizedBox(height: 40),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Don't have an account yet? ",
                  style: AppTypos.regular1.withColor(AppColors.light20),
                ),
                TextSpan(
                  text: "Sign up",
                  style: AppTypos.regular1.copyWith(
                    color: AppColors.violet100,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () =>
                        Navigator.pushReplacementNamed(context, Routers.signUp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
