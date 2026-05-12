import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Centered circular progress indicator in the brand primary colour.
class AppLoadingIndicator extends StatelessWidget {
  final double size;
  final Color? color;

  const AppLoadingIndicator({super.key, this.size = 40, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: color ?? AppColors.primary,
        ),
      ),
    );
  }
}

/// Full-screen loading overlay. Wrap around your Scaffold body.
class AppLoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const AppLoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: AppColors.overlay,
            child: const AppLoadingIndicator(color: AppColors.white),
          ),
      ],
    );
  }
}
