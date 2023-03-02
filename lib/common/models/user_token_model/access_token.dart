class AccessToken {
  String? token;

  AccessToken({this.token});

  factory AccessToken.fromJson(Map<String, dynamic> json) => AccessToken(
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}
