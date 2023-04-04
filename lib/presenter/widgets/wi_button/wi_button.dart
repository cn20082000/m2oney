import 'package:flutter/material.dart';
import 'package:m2oney/utils/extension/ext.dart';

import '../../common/app_colors.dart';
import '../../common/app_typos.dart';

class WiButton extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final Color backgroundColor;
  final Color contentColor;
  final BorderRadius? borderRadius;
  final String content;
  final void Function()? onPressed;

  const WiButton({
    Key? key,
    this.margin,
    this.backgroundColor = AppColors.violet100,
    this.contentColor = AppColors.light80,
    required this.content,
    this.onPressed, this.borderRadius,
  }) : super(key: key);

  factory WiButton.primary({
    EdgeInsetsGeometry? margin,
    BorderRadius? borderRadius,
    required String content,
    void Function()? onPressed,
  }) =>
      WiButton(
        margin: margin,
        backgroundColor: AppColors.violet100,
        contentColor: AppColors.light80,
        borderRadius: borderRadius,
        content: content,
        onPressed: onPressed,
      );

  factory WiButton.secondary({
    EdgeInsetsGeometry? margin,
    BorderRadius? borderRadius,
    required String content,
    void Function()? onPressed,
  }) =>
      WiButton(
        margin: margin,
        backgroundColor: AppColors.violet20,
        contentColor: AppColors.violet100,
        borderRadius: borderRadius,
        content: content,
        onPressed: onPressed,
      );

  factory WiButton.ghost({
    EdgeInsetsGeometry? margin,
    BorderRadius? borderRadius,
    required String content,
    void Function()? onPressed,
  }) =>
      WiButton(
        margin: margin,
        backgroundColor: Colors.transparent,
        contentColor: AppColors.dark50,
        borderRadius: borderRadius,
        content: content,
        onPressed: onPressed,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: borderRadius,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 48,
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    content,
                    style: AppTypos.title3.withColor(
                      contentColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
