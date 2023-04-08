import 'package:cn_datetime_utils/cn_datetime_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import 'presenter/router/routers.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
    builder: (_, __) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routers.intro,
        themeMode: ThemeMode.light,
        onGenerateRoute: (settings) => PageTransition(
          child: Routers.map[settings.name]!(),
          type: PageTransitionType.rightToLeft,
          curve: Curves.easeInOut,
          duration: 250.millisecond,
          reverseDuration: 300.millisecond,
        ),
      );
    },
  ));
}
