List<CreateModel> authModelFromList(List json) {
  return List<CreateModel>.from(
      json.map((model) => CreateModel.fromJson(model)).toList());
}

// options.headers['Authorization'] = 'Bearer: $accessToken';
class CreateModel {
  late String id;
  late String fullName;
  late String phoneNumber;
  late String email;
  late String birthDate;
  String? accessToken;
  String? refreshToken;

  CreateModel(
      {required this.id,
      required this.fullName,
      required this.phoneNumber,
      required this.email,
      required this.birthDate,
      this.accessToken,
      this.refreshToken});

  CreateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    birthDate = json['birthDate'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['birthDate'] = this.birthDate;
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}
