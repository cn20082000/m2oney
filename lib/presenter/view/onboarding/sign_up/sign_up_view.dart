import 'package:cn_structure/cn_structure.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m2oney/utils/extension/ext.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_typos.dart';
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
          padding: EdgeInsets.symmetric(
            vertical: 56.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildInputs(),
              SizedBox(height: 8.h),
              _buildAgreeToPaper(),
              SizedBox(height: 24.h),
              _buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputs() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        children: [
          WiTextField(
            // focusNode: notifier.nameNode,
            autoFocus: true,
            hintText: "Name",
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => notifier.emailNode.requestFocus(),
          ),
          SizedBox(height: 24.h),
          WiTextField(
            focusNode: notifier.emailNode,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => notifier.passwordNode.requestFocus(),
          ),
          SizedBox(height: 24.h),
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
        SizedBox(width: 8.w),
        consumer(
          builder: (_) => Checkbox(
            activeColor: AppColors.violet100,
            side: BorderSide(
              color: AppColors.violet100,
              width: 2.r,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: AppColors.violet100,
                width: 2.r,
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
            value: notifier.agreeToPaper.value,
            onChanged: (value) {
              if (value != null) {
                notifier.agreeToPaper.value = value;
              }
            },
          ),
        ),
        SizedBox(width: 2.w),
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
                    ..onTap = () {
                      debugPrint("Tap: Terms of Service and Privacy Policy");
                    },
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 16.w),
      ],
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        children: [
          Hero(
            tag: "SignUpButton",
            child: WiButton.primary(
              content: "Sign Up",
              onPressed: () {
                debugPrint("Tap: Sign Up");
              },
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            "Or with",
            style: AppTypos.base.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: AppColors.light20,
            ),
          ),
          SizedBox(height: 12.h),
          WiButton.ghost(
            content: "Sign Up with Google",
            onPressed: () {
              debugPrint("Tap: Sign Up with Google");
            },
          ),
          SizedBox(height: 20.h),
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
                    ..onTap = () {
                      debugPrint("Tap: Login");
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
