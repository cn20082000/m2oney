import 'package:cn_datetime_utils/cn_datetime_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/app_colors.dart';

class WiPinTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autoFocus;
  final void Function(String?)? onSubmitted;

  const WiPinTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.autoFocus = false,
    this.onSubmitted,
  }) : super(key: key);

  @override
  State<WiPinTextField> createState() => _WiPinTextFieldState();
}

class _WiPinTextFieldState extends State<WiPinTextField> {
  late TextEditingController textCtrl;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    textCtrl = widget.controller ?? TextEditingController();
    focusNode = widget.focusNode ?? FocusNode();
    textCtrl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    children.add(_buildCharacter(0));
    for (int i = 1; i < 4; ++i) {
      children.add(const SizedBox(width: 16));
      children.add(_buildCharacter(i));
    }

    return Stack(
      children: [
        SizedBox(
          height: 0,
          width: 0,
          child: TextField(
            controller: textCtrl,
            focusNode: focusNode,
            style: const TextStyle(color: Colors.transparent),
            onTapOutside: (_) => focusNode.unfocus(),
            keyboardType: TextInputType.number,
            maxLength: 4,
            autofocus: widget.autoFocus,
            cursorColor: Colors.transparent,
            showCursor: false,
            autocorrect: false,
            enableSuggestions: false,
            maxLines: 1,
            enableInteractiveSelection: false,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("\\d")),
            ],
            decoration: const InputDecoration(
              border: InputBorder.none,
              counterText: "",
            ),
            onSubmitted: widget.onSubmitted,
          ),
        ),
        GestureDetector(
          onTap: focusNode.requestFocus,
          behavior: HitTestBehavior.translucent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildCharacter(int index) {
    return Stack(
      children: [
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            border: Border.all(width: 4, color: AppColors.light40),
          ),
        ),
        AnimatedOpacity(
          duration: 100.millisecond,
          curve: Curves.easeInOut,
          opacity: textCtrl.text.length > index ? 1 : 0,
          child: Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: AppColors.light80,
            ),
          ),
        ),
      ],
    );
  }
}
