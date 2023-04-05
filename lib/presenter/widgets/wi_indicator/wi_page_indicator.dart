import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m2oney/utils/extension/ext.dart';

import '../../common/app_colors.dart';

class WiPageIndicator extends StatefulWidget {
  final PageController controller;
  final int length;

  const WiPageIndicator({
    Key? key,
    required this.controller,
    required this.length,
  }) : super(key: key);

  @override
  State<WiPageIndicator> createState() => _WiPageIndicatorState();
}

class _WiPageIndicatorState extends State<WiPageIndicator> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];
    if (widget.length > 0) {
      items.add(_buildIndicator(0));
      for (int i = 1; i < widget.length; ++i) {
        items.add(SizedBox(width: 8.w));
        items.add(_buildIndicator(i));
      }
    }

    return SizedBox(
      height: 20.h,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: items,
      ),
    );
  }

  Widget _buildIndicator(int index) {
    return InkWell(
      onTap: () {
        if (index.toDouble() != widget.controller.page) {
          widget.controller.animateToPage(
            index,
            duration: 300.millisecond,
            curve: Curves.easeInOut,
          );
        }
      },
      borderRadius: BorderRadius.circular(1000.r),
      child: SizedBox(
        width: 20.h,
        height: 20.h,
        child: Center(
          child: Container(
            width:
                (1 - (index - (widget.controller.page ?? 0)).abs().toDouble())
                            .limit(min: 0, max: 1)
                            .toDouble() *
                        8.h +
                    8.h,
            height:
                (1 - (index - (widget.controller.page ?? 0)).abs().toDouble())
                            .limit(min: 0, max: 1)
                            .toDouble() *
                        8.h +
                    8.h,
            decoration: BoxDecoration(
              color: AppColors.violet100.withOpacity(
                  (1 - (index - (widget.controller.page ?? 0)).abs().toDouble())
                              .limit(min: 0, max: 1)
                              .toDouble() *
                          0.8 +
                      0.2),
              borderRadius: BorderRadius.circular(1000.r),
            ),
          ),
        ),
      ),
    );
  }
}
