import 'package:equatable/equatable.dart';

sealed class CartState extends Equatable {
  const CartState();
  @override
  List<Object?> get props => [];
}
final class CartInitial extends CartState { const CartInitial(); }
final class CartLoading extends CartState { const CartLoading(); }
final class CartLoaded extends CartState { const CartLoaded(); }
final class CartError extends CartState {
  final String message;
  const CartError(this.message);
  @override
  List<Object?> get props => [message];
}
