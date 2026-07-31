import 'package:ex2/core/models/products.dart';

class ProductState {
  final List<Product> products;
  final List<Product> allProducts;
  final List<Product> recommendedProducts;

  const ProductState({
    required this.products,
    required this.allProducts,
    required this.recommendedProducts,
  });

  ProductState copyWith({
    List<Product>? products,
    List<Product>? allProducts,
    List<Product>? recommendedProducts,
  }) {
    return ProductState(
      products: products ?? this.products,
      allProducts: allProducts ?? this.allProducts,
      recommendedProducts: recommendedProducts ?? this.recommendedProducts,
    );
  }
}
