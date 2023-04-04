import 'package:flutter/material.dart';

import 'presenter/router/routers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: Routers.map,
    initialRoute: Routers.intro,
    themeMode: ThemeMode.light,
  ));
}
