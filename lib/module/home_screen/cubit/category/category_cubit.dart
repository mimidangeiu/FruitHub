import 'package:ex2/core/models/category.dart';
import 'package:ex2/core/service/category_service.dart';
import 'package:ex2/module/home_screen/cubit/category/category_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(const CategoryState(categories: []));

  void selectedCategory(Category category) {
    emit(state.copyWith(selectedCategory: category));
  }

  Category? getCategories() {
    final categories = CategoryService().getCategory();
    final selectedCategory = categories.isNotEmpty ? categories.first : null;
    emit(
      state.copyWith(
        categories: categories,
        selectedCategory: selectedCategory,
      ),
    );
    return selectedCategory;
  }
}
