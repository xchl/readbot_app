class UserProfileModel {
  String? username;
  String? email;

  UserProfileModel({this.username, this.email});

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      username: json['username'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
      };
}
