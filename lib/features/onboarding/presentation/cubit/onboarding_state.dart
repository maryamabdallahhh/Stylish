import 'package:equatable/equatable.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();
  @override
  List<Object?> get props => [];
}

final class OnboardingInitial extends OnboardingState {
  const OnboardingInitial();
}

final class OnboardingLoading extends OnboardingState {
  const OnboardingLoading();
}

final class OnboardingPageChanged extends OnboardingState {
  final int currentPage;
  const OnboardingPageChanged(this.currentPage);
  @override
  List<Object?> get props => [currentPage];
}

final class OnboardingSuccess extends OnboardingState {
  const OnboardingSuccess();
}

final class OnboardingError extends OnboardingState {
  final String message;
  const OnboardingError(this.message);
  @override
  List<Object?> get props => [message];
}
