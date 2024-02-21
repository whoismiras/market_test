import 'dart:convert';

import 'package:market_test/core/constants/core_constants.dart';
import 'package:market_test/feature/market_page/data/model/coin_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouritesRepository {
  /// save model
  Future<void> saveCoinModel(CoinModelDto value) async {
    final List<CoinModelDto> cachedValues = await getCachedCoinList();
    if (cachedValues.any((coin) => coin.id == value.id)) {
      cachedValues.removeWhere((coin) => coin.id == value.id);
      return saveCoinList(cachedValues);
    }
    cachedValues.add(value);
    return saveCoinList(cachedValues);
  }

  /// save coin list into favourites list
  Future<void> saveCoinList(List<CoinModelDto> values) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setString(
      CoreConstants.coinsKey,
      json.encode(values.map((e) => e.toMap()).toList()),
    );
    return;
  }

  Future<void> removeCoinModel(CoinModelDto value) async {
    final cachedCoins = await getCachedCoinList()
      ..removeWhere((coin) => coin.id == value.id);
    return saveCoinList(cachedCoins);
  }

  /// get list from favaourites
  Future<List<CoinModelDto>> getCachedCoinList() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final String? encodedJson = sharedPrefs.getString(CoreConstants.coinsKey);

    if (encodedJson?.isEmpty ?? true) {
      return [];
    }
    final dynamic decodedList = json.decode(encodedJson!);

    if (decodedList?.isEmpty ?? true) {
      return [];
    }

    final List<CoinModelDto> result = [];
    for (var item in decodedList!) {
      if (item is! Map<String, dynamic>) {
        continue;
      }
      result.add(CoinModelDto.fromJson(item));
    }
    return result;
  }
}
