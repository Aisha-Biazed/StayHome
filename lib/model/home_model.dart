class HomeModel {
  late String id;
  late String name;
  late String imageUrl;
  late String area;
  late bool isOnline;
  HomeModel(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.area,
      required this.isOnline});

  HomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    area = json['area'];
    isOnline = json['isOnline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['area'] = this.area;
    data['isOnline'] = this.isOnline;
    return data;
  }
}
