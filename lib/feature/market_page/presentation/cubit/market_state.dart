part of 'market_cubit.dart';

class MarketCommonState extends Equatable {
  final List<CoinEntity> coinList;
  final List<CoinEntity> searchResults;
  final bool isLoading;

  const MarketCommonState({
    required this.coinList,
    this.searchResults = const [],
    this.isLoading = false,
  });

  MarketCommonState copyWith({
    List<CoinEntity>? coinList,
    List<CoinEntity>? searchResults,
    bool? isLoading,
  }) {
    return MarketCommonState(
      coinList: coinList ?? this.coinList,
      searchResults: searchResults ?? this.searchResults,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [coinList, searchResults,isLoading];
}
