class OrderTrackingModel {
  OrderTrackingModel({
    required this.id,
    required this.coast,
    required this.currentStage,
    required this.canEvaluate,
    required this.star,
    required this.dateCreated,
  });

  final String? id;
  final int? coast;
  final String? currentStage;
  final bool? canEvaluate;
  final int? star;
  final DateTime dateCreated;

  factory OrderTrackingModel.fromJson(Map<String, dynamic> json) {
    return OrderTrackingModel(
      id: json["id"],
      coast: json["coast"],
      currentStage: json["currentStage"],
      canEvaluate: json["canEvaluate"],
      star: json["star"],
      dateCreated: DateTime.parse(json['dateCreated']),
    );
  }
}
