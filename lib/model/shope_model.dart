class ShopModel {
  ShopModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.shops,
  });

  final String? id;
  final String? name;
  final String? imageUrl;
  final List<Shop> shops;

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
      id: json["id"],
      name: json["name"],
      imageUrl: json["imageUrl"],
      shops: json["shops"] == null
          ? []
          : List<Shop>.from(json["shops"]!.map((x) => Shop.fromJson(x))),
    );
  }
}

class Shop {
  Shop({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.startTime,
    required this.endTime,
    required this.isOnline,
  });

  final String? id;
  final String? name;
  final String? imageUrl;
  final String? address;
  final dynamic startTime;
  final dynamic endTime;
  final bool? isOnline;

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json["id"],
      name: json["name"],
      imageUrl: json["imageUrl"],
      address: json["address"],
      startTime: json["startTime"]!=null?json["startTime"].toString():null,
      endTime: json["endTime"]!=null?json["endTime"].toString():null,
      isOnline: json["isOnline"],
    );
  }
}
