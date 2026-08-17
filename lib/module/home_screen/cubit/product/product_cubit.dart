import 'package:ex2/core/models/category.dart';
import 'package:ex2/core/models/products.dart';
import 'package:ex2/core/service/product_service.dart';
import 'package:ex2/module/home_screen/cubit/category/category_state.dart';
import 'package:ex2/module/home_screen/cubit/category/category_cubit.dart';
import 'package:ex2/module/home_screen/cubit/product/product_state.dart'
    show ProductState;
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductService productService;
  ProductCubit({required this.productService})
    : super(
        const ProductState(
          products: [],
          allProducts: [],
          recommendedProducts: [],
          isLoading: false,
          errorMessage: null,
        ),
      );

  Future<void> loadProducts() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final products = await productService.getProduct();
      final recommended = getProductByCategory(
        products,
        Category(name: 'Recommended'),
      );
      emit(
        state.copyWith(
          allProducts: products,
          products: products, // or filter by selected category later
          recommendedProducts: recommended,
          isLoading: false,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Không thể tải sản phẩm: $e',
        ),
      );
    }
  }

  void getProduct(Category? selectedCategory) async {
    final products = await productService.getProduct();
    final filteredProducts = selectedCategory == null
        ? <Product>[]
        : getProductByCategory(products, selectedCategory);
    final recommendedProducts = getProductByCategory(
      products,
      Category(name: 'Recommended'),
    );

    emit(
      state.copyWith(
        allProducts: products,
        products: filteredProducts,
        recommendedProducts: recommendedProducts,
      ),
    );
  }

  List<Product> getProductByCategory(
    List<Product> products,
    Category category,
  ) {
    return products
        .where(
          (product) => product.categories
              .map((items) => items.name)
              .toList()
              .contains(category.name),
        )
        .toList();
  }

  void filteredProduct(Category category) {
    final filterProduct = getProductByCategory(state.allProducts, category);
    emit(state.copyWith(products: filterProduct));
  }
}
