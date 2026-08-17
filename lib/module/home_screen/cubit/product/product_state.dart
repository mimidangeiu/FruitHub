import 'package:ex2/core/models/products.dart';

class ProductState {
  final List<Product> products;
  final List<Product> allProducts;
  final List<Product> recommendedProducts;
  final bool isLoading;
  final String? errorMessage;

  const ProductState({
    required this.products,
    required this.allProducts,
    required this.recommendedProducts,
    required this.isLoading,
    required this.errorMessage,
  });

  ProductState copyWith({
    List<Product>? products,
    List<Product>? allProducts,
    List<Product>? recommendedProducts,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ProductState(
      products: products ?? this.products,
      allProducts: allProducts ?? this.allProducts,
      recommendedProducts: recommendedProducts ?? this.recommendedProducts,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
