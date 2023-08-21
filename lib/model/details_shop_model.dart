class DetailsShopModel {
  DetailsShopModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.startTime,
    required this.endTime,
    required this.isOnline,
    required this.products,
  });

  final String? id;
  final String? name;
  final String? imageUrl;
  final String? address;
  final dynamic startTime;
  final dynamic endTime;
  final bool? isOnline;
  final List<Product> products;

  factory DetailsShopModel.fromJson(Map<String, dynamic> json) {
    return DetailsShopModel(
      id: json["id"],
      name: json["name"],
      imageUrl: json["imageUrl"],
      address: json["address"],
      startTime:
          json["startTime"] != null ? DateTime.tryParse(json["startTime"]) : null,
      endTime: json["endTime"] != null ? DateTime.tryParse(json["endTime"]) : null,
      isOnline: json["isOnline"],
      products: json["products"] == null
          ? []
          : List<Product>.from(
              json["products"]!.map((x) => Product.fromJson(x))),
    );
  }
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.cost,
  });

  final String? id;
  final String? name;
  final String? imageUrl;
  final int? cost;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      imageUrl: json["imageUrl"],
      cost: json["cost"],
    );
  }
}
