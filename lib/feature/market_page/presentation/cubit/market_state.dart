part of 'market_cubit.dart';


class MarketCommonState extends Equatable {

  final List<CoinEntity> coinList;
  final bool isLoading;

  const MarketCommonState({
    required this.coinList,
   required this.isLoading,
});

  MarketCommonState  copyWith({
    List<CoinEntity>? coinList,
    bool? isLoading,
}){
    return MarketCommonState(
        coinList: coinList ?? this.coinList,
        isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [coinList, isLoading];
}

