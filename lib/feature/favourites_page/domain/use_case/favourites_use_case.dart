import 'package:market_test/core/utils/di_locator.dart';
import 'package:market_test/feature/favourites_page/data/repository/favourites_repository.dart';
import 'package:market_test/feature/market_page/domain/entity/coin_entity.dart';

/// use cse for favourites list
class FavouritesUseCase {
  FavouritesUseCase() : _repository = sl();

  final FavouritesRepository _repository;

  Future<List<CoinEntity>> execute() async {
    final response = await _repository.getCachedCoinList();
    return CoinEntity.fromDtoList(response);
  }

  Future<void> save(CoinEntity value) async {
    return await _repository.saveCoinModel(value.toDto());
  }
  Future<void> remove(CoinEntity value) async {
    return await _repository.removeCoinModel(value.toDto());
  }
}
