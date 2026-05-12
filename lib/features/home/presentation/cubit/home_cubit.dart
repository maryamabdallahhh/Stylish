import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  Future<void> loadHome() async {
    emit(const HomeLoading());
    // TODO: Call use cases
    emit(const HomeLoaded());
  }
}
