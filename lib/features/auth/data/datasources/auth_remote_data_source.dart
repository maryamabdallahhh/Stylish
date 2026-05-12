import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> register({required String name, required String email, required String password});
  Future<void> logout();
  Future<UserModel> getProfile();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient client;
  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<UserModel> login({required String email, required String password}) async {
    final response = await client.post<Map<String, dynamic>>(
      ApiConstants.login,
      data: {'email': email, 'password': password},
    );
    return UserModel.fromJson(response.data!);
  }

  @override
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await client.post<Map<String, dynamic>>(
      ApiConstants.register,
      data: {'name': name, 'email': email, 'password': password},
    );
    return UserModel.fromJson(response.data!);
  }

  @override
  Future<void> logout() async {
    await client.post<void>(ApiConstants.logout);
  }

  @override
  Future<UserModel> getProfile() async {
    final response = await client.get<Map<String, dynamic>>(ApiConstants.profile);
    return UserModel.fromJson(response.data!);
  }
}
