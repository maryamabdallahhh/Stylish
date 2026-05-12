import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/dio_client.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/cart/presentation/cubit/cart_cubit.dart';
import '../../features/product/presentation/cubit/product_cubit.dart';
import '../../features/profile/presentation/cubit/profile_cubit.dart';
import '../../features/checkout/presentation/cubit/checkout_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // ── External ──────────────────────────────────────────────────────────────────
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);

  // ── Core ──────────────────────────────────────────────────────────────────────
  sl.registerLazySingleton<DioClient>(() => DioClient(prefs: sl()));

  // ── Auth feature ──────────────────────────────────────────────────────────────
  _initAuth();

  // ── Other feature cubits (stateless scaffolds) ────────────────────────────────
  sl.registerFactory<HomeCubit>(() => HomeCubit());
  sl.registerFactory<CartCubit>(() => CartCubit());
  sl.registerFactory<ProductCubit>(() => ProductCubit());
  sl.registerFactory<ProfileCubit>(() => ProfileCubit());
  sl.registerFactory<CheckoutCubit>(() => CheckoutCubit());
}

void _initAuth() {
  // Data source
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));

  // Cubit
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      loginUseCase: sl(),
      registerUseCase: sl(),
    ),
  );
}
