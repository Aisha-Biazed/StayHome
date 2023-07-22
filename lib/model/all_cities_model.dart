class GetAllCitiesModel {
  GetAllCitiesModel({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  factory GetAllCitiesModel.fromJson(Map<String, dynamic> json) {
    return GetAllCitiesModel(
      id: json["id"],
      name: json["name"],
    );
  }
}
