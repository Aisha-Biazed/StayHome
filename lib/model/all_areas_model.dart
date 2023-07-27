class GetAllAreasModel {
  GetAllAreasModel({
    required this.id,
    required this.name,
    required this.cityId,
  });

  final String? id;
  final String? name;
  final String? cityId;

  factory GetAllAreasModel.fromJson(Map<String, dynamic> json) {
    return GetAllAreasModel(
      id: json["id"],
      name: json["name"],
      cityId: json["cityId"],
    );
  }
}
