
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:market_test/core/config/theme.dart';
import 'package:market_test/feature/market_page/data/model/coin_model.dart';

class CoinRepository {
  Future<List<CoinModelDto>> getCoinList() async {
    final String response = await rootBundle.loadString(AppData.json);
    final data = await json.decode(response);
    final list = List<CoinModelDto>.from(data['coins']);
    return list;
  }
}