part of 'favourites_cubit.dart';

class FavouritesInitial extends Equatable {
  final List<CoinEntity> coinList;

  const FavouritesInitial({
    required this.coinList,
  });

  FavouritesInitial copyWith({
    List<CoinEntity>? coinList,
  }) {
    return FavouritesInitial(
      coinList: coinList ?? this.coinList,
    );
  }

  @override
  List<Object?> get props => [coinList];
}
