import 'package:equatable/equatable.dart';

sealed class CheckoutState extends Equatable {
  const CheckoutState();
  @override
  List<Object?> get props => [];
}
final class CheckoutInitial extends CheckoutState { const CheckoutInitial(); }
final class CheckoutLoading extends CheckoutState { const CheckoutLoading(); }
final class CheckoutSuccess extends CheckoutState { const CheckoutSuccess(); }
final class CheckoutError extends CheckoutState {
  final String message;
  const CheckoutError(this.message);
  @override
  List<Object?> get props => [message];
}
