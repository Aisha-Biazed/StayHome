class GetAllCitiesWithAreasModel {
  GetAllCitiesWithAreasModel({
    required this.id,
    required this.name,
    required this.areas,
  });

  final String? id;
  final String? name;
  final List<Area> areas;

  factory GetAllCitiesWithAreasModel.fromJson(Map<String, dynamic> json) {
    return GetAllCitiesWithAreasModel(
      id: json["id"],
      name: json["name"],
      areas: json["areas"] == null
          ? []
          : List<Area>.from(json["areas"]!.map((x) => Area.fromJson(x))),
    );
  }
}

class Area {
  Area({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
      id: json["id"],
      name: json["name"],
    );
  }
}
