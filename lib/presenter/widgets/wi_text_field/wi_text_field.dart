import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/resources.dart';
import '../../common/app_colors.dart';
import '../../common/app_typos.dart';

class WiTextField extends StatefulWidget {
  final TextInputType? keyboardType;
  final String? hintText;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final bool autoFocus;
  final TextCapitalization textCapitalization;

  const WiTextField({
    Key? key,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.textInputAction,
    this.onSubmitted,
    this.focusNode,
    this.autoFocus = false,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  State<WiTextField> createState() => _WiTextFieldState();
}

class _WiTextFieldState extends State<WiTextField> {
  bool obscureText = false;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode ?? FocusNode();
    obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    Widget? suffix;
    if (widget.obscureText) {
      suffix = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTapDown: (_) => setState(() => obscureText = false),
            onLongPressDown: (_) => setState(() => obscureText = false),
            onTapUp: (_) => setState(() => obscureText = true),
            onLongPressUp: () => setState(() => obscureText = true),
            child: SvgPicture.asset(
              Svgs.icShowPassword,
              width: 32,
              height: 32,
              theme: const SvgTheme(
                currentColor: AppColors.light20,
              ),
            ),
          ),
        ],
      );
    }

    return TextField(
      style: AppTypos.base.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      keyboardType: widget.keyboardType,
      cursorColor: AppColors.violet100,
      obscureText: obscureText,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
      focusNode: focusNode,
      onTapOutside: (_) => focusNode.unfocus(),
      autofocus: widget.autoFocus,
      textCapitalization: widget.textCapitalization,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTypos.base.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.light20,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        suffixIcon: suffix,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.light60,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.light60,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.violet100,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.red100,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
