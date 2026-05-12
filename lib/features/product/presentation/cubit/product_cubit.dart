import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductInitial());

  Future<void> loadProducts() async {
    emit(const ProductLoading());
    // TODO: Call use cases
    emit(const ProductLoaded());
  }
}
