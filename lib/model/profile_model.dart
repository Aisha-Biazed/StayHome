class ProfileModel {
  late String id;
  late String fullName;
  late String phoneNumber;
  late String email;
  late String birthDate;
  late String gender;

  ProfileModel(
      {required this.id,
      required this.fullName,
      required this.phoneNumber,
      required this.email,
      required this.birthDate,
      required this.gender});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    birthDate = json['birthDate'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['birthDate'] = this.birthDate;
    data['gender'] = this.gender;
    return data;
  }
}
