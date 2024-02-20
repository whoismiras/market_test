
import 'package:market_test/core/utils/di_locator.dart';
import 'package:market_test/feature/market_page/data/repository/coin_repository.dart';
import 'package:market_test/feature/market_page/domain/entity/coin_entity.dart';

class GetCoinInfoUseCase{

GetCoinInfoUseCase() : _repository = sl();

final CoinRepository _repository;

Future<List<CoinEntity>> execute() async {
  final response = await _repository.getCoinList();
  return CoinEntity.fromDtoList(response);
}

}

