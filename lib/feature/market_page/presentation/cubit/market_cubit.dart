import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_test/core/utils/di_locator.dart';
import 'package:market_test/feature/market_page/domain/entity/coin_entity.dart';
import 'package:market_test/feature/market_page/domain/use_case/coin_use_case.dart';

part 'market_state.dart';

class MarketCubit extends Cubit<MarketCommonState> {
  MarketCubit()
      : _coinRepository = sl(),
        super(const MarketCommonState(
          coinList: [],
          isLoading: true,
        ));

  final GetCoinInfoUseCase _coinRepository;

  Future<void> getCoinList() async {
    emit(state.copyWith(isLoading: true));

    final request = await _coinRepository.execute();

    emit(state.copyWith(
      isLoading: false,
      coinList: request,
    ));
  }

  Future<void> onSearch(String? search) async {
    if (search?.isEmpty ?? true) {
      return emit(state.copyWith(
        searchResults: [],
      ));
    }

    String query = search!.toLowerCase();
    final bool isMatching = state.coinList.any(
      (coin) => coin.name.toLowerCase().contains(query),
    );
    if (!isMatching) {
      return emit(state.copyWith(
        searchResults: [],
      ));
    }
    return emit(state.copyWith(
      searchResults: state.coinList
          .where(
            (coin) => coin.name.toLowerCase().contains(query),
          )
          .toList(),
    ));
  }
}
