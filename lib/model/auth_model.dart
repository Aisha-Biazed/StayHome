List<AuthModel> authModelFromList(List json) {
  return List<AuthModel>.from(
      json.map((model) => AuthModel.fromJson(model)).toList());
}

// options.headers['Authorization'] = 'Bearer: $accessToken';
class AuthModel {
  String? id;
  String? fullName;
  String? phoneNumber;
  String? imageUrl;
  String? email;
  String? birthDate;
  String? accessToken;
  String? refreshToken;

  AuthModel(
      {this.id,
      this.fullName,
      this.phoneNumber,
      this.imageUrl,
      this.email,
      this.birthDate,
      this.accessToken,
      this.refreshToken});

  AuthModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    imageUrl = json['imageUrl'];
    email = json['email'];
    birthDate = json['birthDate'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
}
