class RefreshToken {
  String? token;

  RefreshToken({this.token});

  factory RefreshToken.fromJson(Map<String, dynamic> json) => RefreshToken(
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}
