import 'package:cn_structure/cn_structure.dart';
import 'package:flutter/material.dart';

import '../../../widgets/wi_button/wi_button.dart';
import '../../../widgets/wi_status_bar/wi_status_bar.dart';
import 'intro_notifier.dart';

class IntroView extends StatefulWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends CnState<IntroView, IntroNotifier> {
  @override
  IntroNotifier get constructor => IntroNotifier();

  @override
  Widget widgetBuild(BuildContext context) {
    return WiStatusBar.light(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            WiButton.primary(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              borderRadius: BorderRadius.circular(16),
              content: "Sign Up",
              onPressed: () {
                debugPrint("Pressed");
              },
            ),
            const SizedBox(height: 16),
            WiButton.secondary(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              borderRadius: BorderRadius.circular(16),
              content: "Login",
              onPressed: () {
                debugPrint("Pressed");
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
