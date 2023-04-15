import 'package:cn_structure/cn_structure.dart';
import 'package:flutter/material.dart';
import 'package:m2oney/utils/extension/ext.dart';

import '../../../../resources/resources.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_typos.dart';
import '../../../router/routers.dart';
import '../../../widgets/wi_button/wi_button.dart';
import 'forgot_password_sent_notifier.dart';

class ForgotPasswordSentView extends StatefulWidget {
  const ForgotPasswordSentView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordSentView> createState() => _ForgotPasswordSentViewState();
}

class _ForgotPasswordSentViewState
    extends CnState<ForgotPasswordSentView, ForgotPasswordSentNotifier> {
  @override
  ForgotPasswordSentNotifier get constructor => ForgotPasswordSentNotifier();

  @override
  Widget widgetBuild(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: 32 + MediaQuery.of(context).padding.top,
                  bottom: 56,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Image.asset(
                        Images.imgResetPassword,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "Your email is on the way",
                        style: AppTypos.title2.withColor(AppColors.dark100),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "Check your email test@test.com and follow the instructions to reset your password",
                        style: AppTypos.regular1.withColor(AppColors.dark25),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Hero(
                tag: "MainButton",
                child: WiButton.primary(
                  content: "Back to Login",
                  onPressed: () => Navigator.of(context).popToNamed(Routers.login),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
