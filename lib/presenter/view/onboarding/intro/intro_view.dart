import 'package:cn_structure/cn_structure.dart';
import 'package:flutter/material.dart';
import 'package:m2oney/presenter/view/onboarding/intro/intro_notifier.dart';

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
    return Scaffold(
      body: Container(),
    );
  }
}
