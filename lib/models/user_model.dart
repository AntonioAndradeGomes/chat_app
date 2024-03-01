class UserModel {
  String? id;
  String? name;
  String? email;
  String? profileImage;
  String? phoneNumber;
  String? about;

  UserModel(
      {this.id,
      this.email,
      this.name,
      this.phoneNumber,
      this.profileImage,
      this.about});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        profileImage: json['profileImage'],
        phoneNumber: json['phoneNumber'],
        about: json['about'],
      );

  Map<String, dynamic> get toJson => {
        "id": id,
        "name": name,
        "email": email,
        "profileImage": profileImage,
        "phoneNumber": phoneNumber,
        "about": about,
      };
}
