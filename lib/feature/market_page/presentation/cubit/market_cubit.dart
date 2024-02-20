import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_test/core/utils/di_locator.dart';
import 'package:market_test/feature/market_page/domain/entity/coin_entity.dart';
import 'package:market_test/feature/market_page/domain/use_case/coin_use_case.dart';

part 'market_state.dart';

class MarketCubit extends Cubit<MarketCommonState> {
  MarketCubit() :
  _coinRepository = sl(),
        super(const MarketCommonState(coinList: [], isLoading: true,),);

  final GetCoinInfoUseCase _coinRepository;

  Future<void> getCoinList() async {
    final request = _coinRepository.execute();

    emit(
      state.copyWith(
        isLoading: false,
            coinList:await request,
      )
    );
  }
}
