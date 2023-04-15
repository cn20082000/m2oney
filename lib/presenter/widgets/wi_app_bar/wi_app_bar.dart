import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/resources.dart';
import '../../common/app_typos.dart';
import '../wi_status_bar/wi_status_bar_style.dart';

class WiAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;
  final String title;
  final WiStatusBarStyle statusBarStyle;

  @override
  final Size preferredSize;

  WiAppBar({
    Key? key,
    this.toolbarHeight,
    this.bottom,
    required this.title,
    this.statusBarStyle = WiStatusBarStyle.light,
  })  : preferredSize = _PreferredAppBarSize(
          toolbarHeight,
          bottom?.preferredSize.height,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTypos.title3,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: statusBarStyle.titleColor,
      systemOverlayStyle: statusBarStyle.systemUiOverlayStyle,
      leading: InkWell(
        onTap: () => Navigator.of(context).pop(),
        borderRadius: BorderRadius.circular(1000),
        child: Center(
          child: SvgPicture.asset(
            Svgs.icArrowLeft,
            width: 32,
            height: 32,
            theme: statusBarStyle.titleColor != null
                ? SvgTheme(
                    currentColor: statusBarStyle.titleColor!,
                  )
                : const SvgTheme(),
          ),
        ),
      ),
    );
  }
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
