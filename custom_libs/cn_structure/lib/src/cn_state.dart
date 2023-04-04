import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'cn_notifier.dart';

abstract class CnState<T extends StatefulWidget, N extends CnNotifier>
    extends State<T> {
  late N _notifier;

  CnState() {
    _notifier = constructor;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => notifier,
      builder: (ctx, _) => widgetBuild(ctx),
    );
  }

  @protected
  N get constructor;

  N get notifier => _notifier;

  Widget widgetBuild(BuildContext context);

  Widget consumer({required Widget Function(BuildContext) builder}) {
    return Consumer<N>(builder: (ctx, _, __) => builder(ctx));
  }
}
