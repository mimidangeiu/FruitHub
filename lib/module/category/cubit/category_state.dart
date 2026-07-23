import 'package:ex2/core/models/category.dart';

class CategoryState {
  final Category category;

  const CategoryState({required this.category});

  CategoryState copyWith({Category? category}) {
    return CategoryState(category: category ?? this.category);
  }
}
