class BasicProfile {
  int? userId;
  String? email;
  String? username;
  bool? proLevel;
  dynamic proEndTime;

  BasicProfile({
    this.userId,
    this.email,
    this.username,
    this.proLevel,
    this.proEndTime,
  });

  factory BasicProfile.fromJson(Map<String, dynamic> json) => BasicProfile(
        userId: json['user_id'] as int?,
        email: json['email'] as String?,
        username: json['username'] as String?,
        proLevel: json['pro_level'] as bool?,
        proEndTime: json['pro_end_time'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'email': email,
        'username': username,
        'pro_level': proLevel,
        'pro_end_time': proEndTime,
      };
}
