import 'package:market_test/core/constants/core_constants.dart';
import 'package:market_test/feature/market_page/data/model/coin_model.dart';




/// coin entity
class CoinEntity{
  CoinEntity({
    required this.id,
    required this.name,
    required this.tag,
    required this.price,
    required this.iconUrl,
});

  factory CoinEntity.fromDto(CoinModelDto dto) =>
      CoinEntity(id: dto.id ?? CoreConstants.zeroInt,
        name: dto.name ?? CoreConstants.empty,
        tag: dto.tag ?? CoreConstants.empty,
        price: dto.price ?? CoreConstants.empty,
        iconUrl: dto.iconUrl ?? CoreConstants.empty,
      );

  CoinModelDto toDto() {
    return CoinModelDto(
      id: id,
      name: name,
      tag: tag,
      price: price,
      iconUrl: iconUrl,
    );
  }

  static List<CoinEntity> fromDtoList(List<CoinModelDto> dtoList) {
    return dtoList.map(CoinEntity.fromDto).toList();
  }

  final num id;
  final String name;
  final String tag;
  final String price;
  final String iconUrl;
}