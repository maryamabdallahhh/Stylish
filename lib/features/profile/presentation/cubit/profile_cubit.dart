import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileInitial());

  Future<void> loadProfile() async {
    emit(const ProfileLoading());
    // TODO: Call use cases
    emit(const ProfileLoaded());
  }
}
