import 'package:cn_structure/cn_structure.dart';
import 'package:flutter/material.dart';
import 'package:m2oney/utils/extension/ext.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_typos.dart';
import '../../../widgets/wi_status_bar/wi_status_bar.dart';
import '../../../widgets/wi_text_field/wi_pin_text_field.dart';
import 'setup_pin_notifier.dart';

class SetupPinView extends StatefulWidget {
  const SetupPinView({Key? key}) : super(key: key);

  @override
  State<SetupPinView> createState() => _SetupPinViewState();
}

class _SetupPinViewState extends CnState<SetupPinView, SetupPinNotifier> {
  @override
  SetupPinNotifier get constructor => SetupPinNotifier();

  @override
  Widget widgetBuild(BuildContext context) {
    return WiStatusBar.dark(
      child: Scaffold(
        backgroundColor: AppColors.violet100,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 48,
              bottom: 56,
              left: 16,
              right: 16,
            ),
            child: Column(
              children: [
                consumer(
                  builder: (_) => Text(
                    notifier.confirmPin.value
                        ? "Ok. Re type your PIN again"
                        : "Let's setup your PIN",
                    style: AppTypos.title3.withColor(AppColors.light80),
                  ),
                ),
                const SizedBox(height: 92),
                WiPinTextField(
                  controller: notifier.pinCtrl,
                  focusNode: notifier.pinNode,
                  autoFocus: true,
                  onSubmitted: (_) {
                    if (!notifier.confirmPin.value) {
                      notifier.confirmPin.value = true;
                      notifier.pinCtrl.clear();
                      notifier.pinNode.requestFocus();
                    } else {
                      debugPrint("Tap: Confirm pin");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
