import 'package:cn_structure/cn_structure.dart';
import 'package:flutter/material.dart';
import 'package:m2oney/utils/extension/ext.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_typos.dart';
import '../../../router/routers.dart';
import '../../../widgets/wi_app_bar/wi_app_bar.dart';
import '../../../widgets/wi_button/wi_button.dart';
import '../../../widgets/wi_text_field/wi_text_field.dart';
import 'forgot_password_notifier.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState
    extends CnState<ForgotPasswordView, ForgotPasswordNotifier> {
  @override
  ForgotPasswordNotifier get constructor => ForgotPasswordNotifier();

  @override
  Widget widgetBuild(BuildContext context) {
    return Scaffold(
      appBar: WiAppBar(
        title: "Forgot Password",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 56,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              Text(
                "Don't worry.\nEnter your email and we'll send you a link to reset your password.",
                style: AppTypos.title2.withColor(AppColors.dark100),
              ),
              const SizedBox(height: 48),
              WiTextField(
                autoFocus: true,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) =>
                    Navigator.pushNamed(context, Routers.forgotPasswordSent),
              ),
              const SizedBox(height: 32),
              Hero(
                tag: "MainButton",
                child: WiButton.primary(
                  content: "Continue",
                  onPressed: () =>
                      Navigator.pushNamed(context, Routers.forgotPasswordSent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
