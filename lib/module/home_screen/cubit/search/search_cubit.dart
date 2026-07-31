import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());

  void search(String keyword) {
    emit(state.copyWith(keyword: keyword));
  }

  void clear() {
    emit(const SearchState());
  }
}
