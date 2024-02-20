import 'package:get_it/get_it.dart';
import 'package:market_test/feature/market_page/data/repository/coin_repository.dart';
import 'package:market_test/feature/market_page/domain/use_case/coin_use_case.dart';


final sl = GetIt.instance;

Future<void> initLocator() async {
  _repositoryModule();
  _useCaseModule();
}

/// repository module
void _repositoryModule() =>
  sl
    ..registerFactory(CoinRepository.new);

/// useCase module
void _useCaseModule() =>
  sl
    ..registerFactory(GetCoinInfoUseCase.new);