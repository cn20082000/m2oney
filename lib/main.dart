import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'presenter/router/routers.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
    builder: (_, __) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: Routers.map,
        initialRoute: Routers.intro,
        themeMode: ThemeMode.light,
      );
    }
  ));
}
