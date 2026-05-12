import 'package:flutter_bloc/flutter_bloc.dart';
import 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(const CheckoutInitial());

  Future<void> placeOrder() async {
    emit(const CheckoutLoading());
    // TODO: Call use cases
    emit(const CheckoutSuccess());
  }
}
