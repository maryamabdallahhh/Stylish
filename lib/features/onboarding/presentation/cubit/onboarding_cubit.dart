import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_constants.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final SharedPreferences _prefs;

  /// PageController lives in the cubit so the widget stays StatelessWidget.
  final PageController pageController = PageController();

  static const int totalPages = 3;

  OnboardingCubit(this._prefs) : super(const OnboardingInitial());

  int get currentPage {
    final state = this.state;
    return state is OnboardingPageChanged ? state.currentPage : 0;
  }

  void onPageChanged(int page) {
    if (!isClosed) emit(OnboardingPageChanged(page));
  }

  void next() {
    if (currentPage < totalPages - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _complete();
    }
  }

  void prev() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  void skip() => _complete();

  Future<void> _complete() async {
    await _prefs.setBool(AppConstants.kOnboardingSeen, true);
    if (!isClosed) emit(const OnboardingSuccess());
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
