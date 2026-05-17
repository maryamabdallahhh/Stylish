import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

enum OnboardingIllustrationId { chooseProducts, makePayment, getYourOrder }

/// Code-drawn placeholder illustration for each onboarding page.
/// Replace the body with actual exported assets from Figma when ready.
class OnboardingIllustration extends StatelessWidget {
  final OnboardingIllustrationId id;

  const OnboardingIllustration({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return switch (id) {
      OnboardingIllustrationId.chooseProducts => _ChooseProductsIllustration(),
      OnboardingIllustrationId.makePayment    => _MakePaymentIllustration(),
      OnboardingIllustrationId.getYourOrder   => _GetYourOrderIllustration(),
    };
  }
}

// ─── Page 1: Choose Products ──────────────────────────────────────────────────

class _ChooseProductsIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _IllustrationShell(
      backgroundColor: AppColors.primarySurface,
      accentColor: AppColors.primary,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Decorative background circle
          Container(
            width: 240.w,
            height: 240.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withValues(alpha: 0.08),
            ),
          ),
          // Main icon
          Icon(Icons.shopping_bag_outlined, size: 120.sp, color: AppColors.primary),
          // Small accent circles
          Positioned(
            top: 40.h, right: 60.w,
            child: _DotAccent(color: AppColors.primary, size: 14.w),
          ),
          Positioned(
            bottom: 50.h, left: 55.w,
            child: _DotAccent(color: AppColors.primaryLight, size: 10.w),
          ),
          Positioned(
            top: 80.h, left: 48.w,
            child: _DotAccent(color: AppColors.grey300, size: 8.w),
          ),
        ],
      ),
    );
  }
}

// ─── Page 2: Make Payment ─────────────────────────────────────────────────────

class _MakePaymentIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _IllustrationShell(
      backgroundColor: const Color(0xFFEFF4FF),
      accentColor: const Color(0xFF3B82F6),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 240.w,
            height: 240.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF3B82F6).withValues(alpha: 0.08),
            ),
          ),
          Icon(Icons.payment_outlined, size: 120.sp, color: const Color(0xFF3B82F6)),
          Positioned(
            top: 50.h, right: 55.w,
            child: _DotAccent(color: const Color(0xFF3B82F6), size: 14.w),
          ),
          Positioned(
            bottom: 45.h, left: 60.w,
            child: _DotAccent(color: AppColors.grey300, size: 10.w),
          ),
        ],
      ),
    );
  }
}

// ─── Page 3: Get Your Order ───────────────────────────────────────────────────

class _GetYourOrderIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _IllustrationShell(
      backgroundColor: AppColors.successSurface,
      accentColor: AppColors.success,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 240.w,
            height: 240.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.success.withValues(alpha: 0.08),
            ),
          ),
          Icon(Icons.local_shipping_outlined, size: 120.sp, color: AppColors.success),
          Positioned(
            top: 45.h, right: 58.w,
            child: _DotAccent(color: AppColors.success, size: 14.w),
          ),
          Positioned(
            bottom: 48.h, left: 58.w,
            child: _DotAccent(color: AppColors.grey300, size: 10.w),
          ),
        ],
      ),
    );
  }
}

// ─── Shared helpers ───────────────────────────────────────────────────────────

class _IllustrationShell extends StatelessWidget {
  final Color backgroundColor;
  final Color accentColor;
  final Widget child;

  const _IllustrationShell({
    required this.backgroundColor,
    required this.accentColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: backgroundColor,
      child: Center(child: child),
    );
  }
}

class _DotAccent extends StatelessWidget {
  final Color color;
  final double size;
  const _DotAccent({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
