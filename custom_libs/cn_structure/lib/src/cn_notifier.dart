import 'package:flutter/foundation.dart';

import 'cn_rx.dart';

abstract class CnNotifier with ChangeNotifier {
  CnNotifier() {
    setup();
  }

  @protected
  Iterable<CnRx> get variables;

  void setup() {
    final itr = variables.iterator;
    while (itr.moveNext()) {
      itr.current.notify = notifyListeners;
    }
  }
}
