import 'package:equatable/equatable.dart';

sealed class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object?> get props => [];
}
final class ProductInitial extends ProductState { const ProductInitial(); }
final class ProductLoading extends ProductState { const ProductLoading(); }
final class ProductLoaded extends ProductState { const ProductLoaded(); }
final class ProductError extends ProductState {
  final String message;
  const ProductError(this.message);
  @override
  List<Object?> get props => [message];
}
