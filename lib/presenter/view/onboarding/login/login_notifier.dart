import 'package:cn_structure/cn_structure.dart';
import 'package:flutter/widgets.dart';

class LoginNotifier extends CnNotifier {
  final emailNode = FocusNode();
  final passwordNode = FocusNode();

  @override
  Iterable<CnRx> get variables => [];
}
