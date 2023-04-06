import 'package:cn_structure/cn_structure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: PageView(
                  controller: notifier.pageCtrl,
                  children: [
                    _buildPage(0),
                    _buildPage(1),
                    _buildPage(2),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 28.h,
                  horizontal: 32.w,
                ),
                child: Center(
                  child: WiPageIndicator(
                    controller: notifier.pageCtrl,
                    length: 3,
                  ),
                ),
              ),
              WiButton.primary(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                borderRadius: BorderRadius.circular(16.r),
                content: "Sign Up",
                onPressed: () {
                  Navigator.of(context).pushNamed(Routers.signUp);
                },
              ),
              SizedBox(height: 16.h),
              WiButton.secondary(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                borderRadius: BorderRadius.circular(16.r),
                content: "Login",
                onPressed: () {},
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
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

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: 32.h,
              left: 32.w,
              right: 32.w,
            ),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 60.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.w),
          child: Text(
            title,
            style: AppTypos.title1.withColor(AppColors.dark50),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.w),
          child: Text(
            content,
            style: AppTypos.regular1.withColor(AppColors.light20),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
