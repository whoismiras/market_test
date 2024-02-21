import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:market_test/core/config/theme.dart';
import 'package:market_test/feature/market_page/data/model/coin_model.dart';

class CoinRepository {
  /// get data from json list
  Future<List<dynamic>> decodeList() async {
    final String response = await rootBundle.loadString(AppData.dataSource);
    final data = await json.decode(response);
    return data['coins'];
  }

  /// fetch data into neccessary format
  Future<List<CoinModelDto>> getCoinList() async {
    final json = await decodeList();
    final result = List<CoinModelDto>.from(
      json.map(
        (e) => CoinModelDto.fromJson(e),
      ),
    );
    return result;
  }
}
