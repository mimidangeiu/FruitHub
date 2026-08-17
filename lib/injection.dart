import 'package:ex2/core/service/product_service.dart';
import 'package:ex2/core/storage/share_preferences.dart';
import 'package:ex2/module/authentication/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerFactory<ProductService>(() => ProductService());
  getIt.registerFactory<AuthCubit>(() => AuthCubit(AuthLocalStorage()));
}
