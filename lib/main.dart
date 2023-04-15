import 'package:cn_datetime_utils/cn_datetime_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

import 'presenter/router/routers.dart';

void main() async {
  // await preRun();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routers.intro,
    themeMode: ThemeMode.light,
    onGenerateRoute: (settings) => PageTransition(
      child: Routers.map[settings.name]!(),
      type: PageTransitionType.rightToLeft,
      curve: Curves.easeInOut,
      duration: 250.millisecond,
      reverseDuration: 300.millisecond,
      settings: settings,
    ),
  ));
}

Future<void> preRun() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
