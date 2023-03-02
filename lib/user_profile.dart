class UserProfile {
  String? username;
  String? email;

  UserProfile({this.username, this.email});

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        username: json['username'] as String?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
      };
}
