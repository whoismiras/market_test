import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_test/core/utils/di_locator.dart';
import 'package:market_test/feature/favourites_page/domain/use_case/favourites_use_case.dart';
import 'package:market_test/feature/market_page/domain/entity/coin_entity.dart';

part 'favourites_state.dart';

/// favourites cubit
class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit()
      : _favouritesUseCase = sl(),
        super(const FavouritesState(coinList: []));

  final FavouritesUseCase _favouritesUseCase;

  Future<void> getFavouritesList() async {
    final cachedCoins = await _favouritesUseCase.execute();

    emit(state.copyWith(
      coinList: cachedCoins,
    ));
  }

  Future<void> saveCoin(CoinEntity value) async {
    await _favouritesUseCase.save(value);
    return getFavouritesList();
  }

  Future<void> removeCoin(CoinEntity value) async {
    await _favouritesUseCase.remove(value);
    return getFavouritesList();
  }
}
