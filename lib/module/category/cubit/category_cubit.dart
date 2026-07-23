import 'package:ex2/core/models/category.dart';
import 'package:ex2/module/category/cubit/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState(category: Category.Hottest));

  void uploadCategory(Category category) {
    emit(state.copyWith(category: category));
  }
}
