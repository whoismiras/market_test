
import 'dart:convert';

/// coin model dto object
class CoinModelDto {
  CoinModelDto({
    this.id,
    this.name,
    this.tag,
    this.price,
    this.iconUrl,
});

  CoinModelDto.fromJson(Map<String, dynamic> json) {
    id = json['id'] as num?;
    name = json['name'] as String?;
    tag = json['tag'] as String?;
    price = json['price'] as String?;
    iconUrl = json['icon'] as String?;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tag': tag,
      'price': price,
      'icon': iconUrl,
    };
  }

  String toJson() => json.decode(toMap().toString());

   num? id;
   String? name;
   String? tag;
   String? price;
   String? iconUrl;
}