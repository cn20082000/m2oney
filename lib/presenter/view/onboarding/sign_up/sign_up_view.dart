import 'package:cn_structure/cn_structure.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m2oney/utils/extension/ext.dart';

import '../../../../resources/resources.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_typos.dart';
import '../../../router/routers.dart';
import '../../../widgets/wi_app_bar/wi_app_bar.dart';
import '../../../widgets/wi_button/wi_button.dart';
import '../../../widgets/wi_text_field/wi_text_field.dart';
import 'sign_up_notifier.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends CnState<SignUpView, SignUpNotifier> {
  @override
  SignUpNotifier get constructor => SignUpNotifier();

  @override
  Widget widgetBuild(BuildContext context) {
    return Scaffold(
      appBar: WiAppBar(
        title: "Sign Up",
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
              const SizedBox(height: 8),
              _buildAgreeToPaper(),
              const SizedBox(height: 24),
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
            focusNode: notifier.nameNode,
            hintText: "Name",
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            onSubmitted: (_) => notifier.emailNode.requestFocus(),
          ),
          const SizedBox(height: 24),
          WiTextField(
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
          ),
        ],
      ),
    );
  }

  Widget _buildAgreeToPaper() {
    return Row(
      children: [
        const SizedBox(width: 8),
        consumer(
          builder: (_) => Checkbox(
            activeColor: AppColors.violet100,
            side: const BorderSide(
              color: AppColors.violet100,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: AppColors.violet100,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            value: notifier.agreeToPaper.value,
            onChanged: (value) {
              if (value != null) {
                notifier.agreeToPaper.value = value;
              }
            },
          ),
        ),
        const SizedBox(width: 2),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "By signing up, you agree to the ",
                  style: AppTypos.regular3,
                ),
                TextSpan(
                  text: "Terms of Service and Privacy Policy",
                  style: AppTypos.regular3.withColor(AppColors.violet100),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () =>
                        debugPrint("Tap: Terms of Service and Privacy Policy"),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
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
              content: "Sign Up",
              onPressed: () =>
                  Navigator.pushNamed(context, Routers.verification),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Or with",
            style: AppTypos.base.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: AppColors.light20,
            ),
          ),
          const SizedBox(height: 12),
          WiButton.ghost(
            prefix: SvgPicture.asset(
              Svgs.icGoogle,
              height: 32,
              width: 32,
            ),
            content: "Sign Up with Google",
            onPressed: () => debugPrint("Tap: Sign Up with Google"),
          ),
          const SizedBox(height: 20),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Already have an account? ",
                  style: AppTypos.regular1.withColor(AppColors.light20),
                ),
                TextSpan(
                  text: "Login",
                  style: AppTypos.regular1.copyWith(
                    color: AppColors.violet100,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Navigator.pushNamed(context, Routers.login),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
