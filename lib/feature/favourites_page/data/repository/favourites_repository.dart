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
    await sharedPrefs.setStringList(
      CoreConstants.coinsKey,
      values.map((e) => e.toJson()).toList(),
    );
    return;
  }

  /// get list from favaourites
  Future<List<CoinModelDto>> getCachedCoinList() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final List<String>? encodedJson = sharedPrefs.getStringList(CoreConstants.coinsKey);
    if (encodedJson?.isEmpty ?? true) {
      return [];
    }

    final List<CoinModelDto> result = [];
    for (var item in encodedJson!) {
      final dynamic decodedItem = json.decode(item);
      if (decodedItem is! Map<String, dynamic>) {
        continue;
      }
      result.add(CoinModelDto.fromJson(decodedItem));
    }
    return result;
  }
}
