import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_test/core/utils/di_locator.dart';
import 'package:market_test/feature/favourites_page/domain/use_case/favourites_use_case.dart';
import 'package:market_test/feature/market_page/domain/entity/coin_entity.dart';

part 'favourites_state.dart';

/// favourites cubit
class FavouritesCubit extends Cubit<FavouritesInitial> {
  FavouritesCubit()
      : _favouritesRepository = sl(),
        super(
          const FavouritesInitial(coinList: []),
        );

  final FavouritesUseCase _favouritesRepository;

  Future<void> getFavouritesList() async {
    final request = _favouritesRepository.execute();
    emit(state.copyWith(
      coinList: await request,
    ));
  }

  Future<void> saveCoin(CoinEntity value) async {
    _favouritesRepository.save(value);
  }
}
