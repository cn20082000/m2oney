import 'package:cn_structure/cn_structure.dart';
import 'package:flutter/material.dart';
import 'package:m2oney/utils/extension/ext.dart';

import '../../../../resources/resources.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_typos.dart';
import '../../../router/routers.dart';
import '../../../widgets/wi_button/wi_button.dart';
import '../../../widgets/wi_indicator/wi_page_indicator.dart';
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
        body: SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    _buildPageView(),
                    Positioned(
                      bottom: 0,
                      child: _buildIndicator(),
                    ),
                  ],
                ),
              ),
              _buildButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return PageView(
      controller: notifier.pageCtrl,
      children: [
        _buildPage(0),
        _buildPage(1),
        _buildPage(2),
      ],
    );
  }

  Widget _buildIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 28,
        horizontal: 32,
      ),
      child: Center(
        child: WiPageIndicator(
          controller: notifier.pageCtrl,
          length: 3,
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Hero(
            tag: "MainButton",
            child: WiButton.primary(
              content: "Sign Up",
              onPressed: () => Navigator.of(context).pushNamed(Routers.signUp),
            ),
          ),
          const SizedBox(height: 16),
          WiButton.secondary(
            content: "Login",
            onPressed: () => Navigator.of(context).pushNamed(Routers.login),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    String image = "";
    String title = "";
    String content = "";

    switch (index) {
      case 0:
        image = Images.imgIntro1;
        title = "Gain total control of money";
        content = "Become your own money manager and make every cent count";
        break;
      case 1:
        image = Images.imgIntro2;
        title = "Know where your money goes";
        content =
            "Track your transaction easily, with categories and financial report";
        break;
      case 2:
        image = Images.imgIntro3;
        title = "Planning ahead";
        content = "Setup your budget for each category so you in control";
        break;
    }

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: 32 + MediaQuery.of(context).padding.top,
        bottom: 76,
      ),
      reverse: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32
            ),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Text(
              title,
              style: AppTypos.title1.withColor(AppColors.dark50),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Text(
              content,
              style: AppTypos.regular1.withColor(AppColors.light20),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
