
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

   num? id;
   String? name;
   String? tag;
   String? price;
   String? iconUrl;
}