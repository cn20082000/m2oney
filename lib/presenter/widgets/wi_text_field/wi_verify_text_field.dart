import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2oney/utils/extension/ext.dart';

import '../../common/app_colors.dart';
import '../../common/app_typos.dart';

class WiVerifyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autoFocus;

  const WiVerifyTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  State<WiVerifyTextField> createState() => _WiVerifyTextFieldState();
}

class _WiVerifyTextFieldState extends State<WiVerifyTextField> {
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
    final painter = TextPainter(
      text: TextSpan(
        text: "0",
        style: AppTypos.title1,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    );
    painter.layout();
    final height = painter.height;

    final children = <Widget>[];
    children.add(_buildCharacter(0, painter.width));
    for (int i = 1; i < 6; ++i) {
      children.add(const SizedBox(width: 16));
      children.add(_buildCharacter(i, painter.width));
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
            maxLength: 6,
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
          ),
        ),
        GestureDetector(
          onTap: focusNode.requestFocus,
          behavior: HitTestBehavior.translucent,
          child: SizedBox(
            height: height,
            child: Row(
              children: children,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCharacter(int index, double textWidth) {
    if (textCtrl.text.length > index) {
      return SizedBox(
        width: textWidth,
        child: Center(
          child: Text(
            textCtrl.text[index],
            style: AppTypos.title1.withColor(AppColors.dark75),
          ),
        ),
      );
    }
    return Container(
      height: 16,
      width: 16,
      margin: EdgeInsets.symmetric(
        horizontal: (textWidth - 16).limit(min: 0).toDouble() / 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.light40,
        borderRadius: BorderRadius.circular(1000),
      ),
    );
  }
}
