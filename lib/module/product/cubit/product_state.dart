import 'package:ex2/core/models/products.dart';

class ProductState {
  final List<Product> products;

  const ProductState({required this.products});

  ProductState copyWith({List<Product>? products}) {
    return ProductState(products: products ?? this.products);
  }
}
