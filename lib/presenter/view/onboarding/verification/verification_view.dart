import 'package:cn_structure/cn_structure.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:m2oney/utils/extension/ext.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_typos.dart';
import '../../../widgets/wi_app_bar/wi_app_bar.dart';
import '../../../widgets/wi_button/wi_button.dart';
import '../../../widgets/wi_text_field/wi_verify_text_field.dart';
import 'verification_notifier.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState
    extends CnState<VerificationView, VerificationNotifier> {
  @override
  VerificationNotifier get constructor => VerificationNotifier();

  @override
  Widget widgetBuild(BuildContext context) {
    return Scaffold(
      appBar: WiAppBar(
        title: "Verification",
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildMainContent(),
                    const SizedBox(height: 16),
                    _buildButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter your Verification Code",
          style: AppTypos.base.copyWith(
            fontSize: 36,
            fontWeight: FontWeight.w500,
            color: AppColors.dark100,
          ),
        ),
        const SizedBox(height: 48),
        const WiVerifyTextField(
          autoFocus: true,
        ),
        const SizedBox(height: 48),
        consumer(builder: (context) {
          final minute =
              (notifier.timeRemaining.value.inMicroseconds / 1000 / 1000 / 60)
                  .truncate();
          final second = ((notifier.timeRemaining.value.inMicroseconds -
                      minute * 1000 * 1000 * 60) /
                  1000 /
                  1000)
              .truncate();
          return Text(
            "${minute.toString().padLeft(2, "0")}:${second.toString().padLeft(2, "0")}",
            style: AppTypos.title3.withColor(AppColors.violet100),
          );
        }),
        const SizedBox(height: 16),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "We send verification code to your email ",
                style: AppTypos.regular1.withColor(AppColors.dark50),
              ),
              TextSpan(
                text: "brajaoma*****@gmail.com",
                style: AppTypos.regular1.withColor(AppColors.violet100),
              ),
              TextSpan(
                text: ". You can check your inbox.",
                style: AppTypos.regular1.withColor(AppColors.dark50),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text.rich(
          TextSpan(
            text: "I didn't received the code? Send again",
            style: AppTypos.regular1.copyWith(
              color: AppColors.violet100,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = notifier.resetTimer,
          ),
        ),
      ],
    );
  }

  Widget _buildButton() {
    return Hero(
      tag: "MainButton",
      child: WiButton.primary(
        content: "Verify",
        onPressed: () => debugPrint("Tap: Verify"),
      ),
    );
  }
}
