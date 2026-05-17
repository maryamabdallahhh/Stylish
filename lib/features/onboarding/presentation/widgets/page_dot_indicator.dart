import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

/// Animated dot-based progress indicator for onboarding pages.
/// Active dot expands into a pill; inactive dots shrink to circles.
/// No StatefulWidget — relies on AnimatedContainer for implicit animation.
class PageDotIndicator extends StatelessWidget {
  final int pageCount;
  final int currentPage;

  const PageDotIndicator({
    super.key,
    required this.pageCount,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(pageCount, (index) {
        final isActive = index == currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: EdgeInsets.only(right: index < pageCount - 1 ? 6.w : 0),
          width: isActive ? 24.w : 8.w,
          height: 8.h,
          decoration: BoxDecoration(
            color: isActive ? AppColors.textPrimary : AppColors.grey300,
            borderRadius: BorderRadius.circular(100.r),
          ),
        );
      }),
    );
  }
}
