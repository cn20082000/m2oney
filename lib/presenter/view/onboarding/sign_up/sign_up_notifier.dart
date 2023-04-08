import 'package:cn_structure/cn_structure.dart';
import 'package:flutter/widgets.dart';

class SignUpNotifier extends CnNotifier {
  final nameNode = FocusNode();
  final emailNode = FocusNode();
  final passwordNode = FocusNode();

  final agreeToPaper = CnRx(false);

  @override
  Iterable<CnRx> get variables => [
    agreeToPaper,
  ];
}
