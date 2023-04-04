import 'package:flutter/material.dart';
import 'package:m2oney/presenter/router/routers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: Routers.map,
    initialRoute: Routers.intro,
  ));
}
