import 'package:ex2/core/models/products.dart';
import 'package:ex2/module/favourite/cubit/favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final Product product;

  FavouriteCubit(this.product)
    : super(FavouriteState(isLiked: product.isLiked));

  void tappedHeart() {
    product.isLiked = !product.isLiked;
    emit(state.copyWith(isLiked: product.isLiked));
  }
}
