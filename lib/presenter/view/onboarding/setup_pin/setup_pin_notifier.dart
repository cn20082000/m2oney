import 'package:cn_structure/cn_structure.dart';
import 'package:flutter/widgets.dart';

class SetupPinNotifier extends CnNotifier {
  final confirmPin = CnRx(false);

  final pinCtrl = TextEditingController();
  final pinNode = FocusNode();

  @override
  Iterable<CnRx> get variables => [
    confirmPin,
  ];
}
