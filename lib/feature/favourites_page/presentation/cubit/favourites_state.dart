part of 'favourites_cubit.dart';

class FavouritesState extends Equatable {
  final List<CoinEntity> coinList;

  const FavouritesState({
    required this.coinList,
  });

  FavouritesState copyWith({
    List<CoinEntity>? coinList,
  }) {
    return FavouritesState(
      coinList: coinList ?? this.coinList,
    );
  }

  @override
  List<Object?> get props => [coinList];
}
