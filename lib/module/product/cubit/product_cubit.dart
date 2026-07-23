import 'package:ex2/core/data/mock_products.dart';
import 'package:ex2/core/models/products.dart';
import 'package:ex2/module/product/cubit/product_state.dart' show ProductState;
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState(products: products));
  List<Product> uploadProduct() {
    return state.products;
  }
}
