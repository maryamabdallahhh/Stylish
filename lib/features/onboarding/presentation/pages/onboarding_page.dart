import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../cubit/onboarding_cubit.dart';
import '../cubit/onboarding_state.dart';
import '../widgets/onboarding_illustration.dart';
import '../widgets/page_dot_indicator.dart';

// ─── Data model ───────────────────────────────────────────────────────────────

class _OnboardingPageData {
  final String title;
  final String description;
  final OnboardingIllustrationId illustration;

  const _OnboardingPageData({
    required this.title,
    required this.description,
    required this.illustration,
  });
}

const _pages = [
  _OnboardingPageData(
    title: 'Choose Products',
    description:
        'Browse thousands of fashion products and find exactly what you\'re looking for with smart filters.',
    illustration: OnboardingIllustrationId.chooseProducts,
  ),
  _OnboardingPageData(
    title: 'Make Payment',
    description:
        'Enjoy fast and secure checkout with multiple payment options available at your fingertips.',
    illustration: OnboardingIllustrationId.makePayment,
  ),
  _OnboardingPageData(
    title: 'Get Your Order',
    description:
        'Track your orders in real-time and receive fast delivery straight to your doorstep.',
    illustration: OnboardingIllustrationId.getYourOrder,
  ),
];

// ─── Page ─────────────────────────────────────────────────────────────────────

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingSuccess) {
          context.go(RouteNames.login);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // ── Page counter + Skip ─────────────────────────────────────────
              _TopBar(),
              // ── Illustration (55% height) ───────────────────────────────────
              Expanded(
                flex: 55,
                child: BlocBuilder<OnboardingCubit, OnboardingState>(
                  builder: (context, state) {
                    return PageView.builder(
                      controller: context.read<OnboardingCubit>().pageController,
                      onPageChanged: context.read<OnboardingCubit>().onPageChanged,
                      itemCount: _pages.length,
                      itemBuilder: (_, index) => OnboardingIllustration(
                        id: _pages[index].illustration,
                      ),
                    );
                  },
                ),
              ),
              // ── Bottom content ──────────────────────────────────────────────
              Expanded(
                flex: 45,
                child: _BottomContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Top bar ─────────────────────────────────────────────────────────────────

class _TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final page = state is OnboardingPageChanged ? state.currentPage : 0;
        final cubit = context.read<OnboardingCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${page + 1}/${_pages.length}',
                style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
              ),
              GestureDetector(
                onTap: cubit.skip,
                child: Text(
                  'Skip',
                  style: AppTextStyles.bodyMd.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─── Bottom content (title + desc + dots + nav buttons) ──────────────────────

class _BottomContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final page = state is OnboardingPageChanged ? state.currentPage : 0;
        final cubit = context.read<OnboardingCubit>();
        final data = _pages[page];
        final isFirst = page == 0;
        final isLast = page == _pages.length - 1;

        return Padding(
          padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  data.title,
                  key: ValueKey(page),
                  style: AppTextStyles.h3.copyWith(color: AppColors.textPrimary),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 12.h),
              // Description
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  data.description,
                  key: ValueKey('desc_$page'),
                  style: AppTextStyles.bodyMd.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ),
              const Spacer(),
              // Dots + Nav buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Prev
                  GestureDetector(
                    onTap: isFirst ? null : cubit.prev,
                    child: Text(
                      'Prev',
                      style: AppTextStyles.bodyMd.copyWith(
                        color: isFirst ? Colors.transparent : AppColors.grey400,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // Dots
                  PageDotIndicator(
                    pageCount: _pages.length,
                    currentPage: page,
                  ),
                  // Next / Get Started
                  GestureDetector(
                    onTap: cubit.next,
                    child: Text(
                      isLast ? 'Get Started' : 'Next',
                      style: AppTextStyles.bodyMd.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
