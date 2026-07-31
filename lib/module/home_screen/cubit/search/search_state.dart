import 'package:ex2/core/models/products.dart';

class SearchState {
  final String keyword;

  const SearchState({this.keyword = ''});

  SearchState copyWith({String? keyword, List<Product>? results}) {
    return SearchState(keyword: keyword ?? this.keyword);
  }
}
