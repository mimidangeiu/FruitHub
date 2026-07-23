class FavouriteState {
  final bool isLiked;

  const FavouriteState({required this.isLiked});

  FavouriteState copyWith({bool? isLiked}) {
    return FavouriteState(isLiked: isLiked ?? this.isLiked);
  }
}
