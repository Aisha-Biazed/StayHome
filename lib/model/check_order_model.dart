class OrderCheckModel {
  OrderCheckModel({
    required this.deliveryCoast,
  });

  final int? deliveryCoast;

  factory OrderCheckModel.fromJson(Map<String, dynamic> json) {
    return OrderCheckModel(
      deliveryCoast: json["deliveryCoast"],
    );
  }
}
