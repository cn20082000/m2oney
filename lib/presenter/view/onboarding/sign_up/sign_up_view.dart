import 'package:cn_structure/cn_structure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/wi_app_bar/wi_app_bar.dart';
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
            horizontal: 16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                ),
              ),
              SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              SizedBox(height: 24),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
