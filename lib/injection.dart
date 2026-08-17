import 'package:ex2/core/service/product_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
   getIt.registerFactory<ProductService>(() => ProductService());
}
