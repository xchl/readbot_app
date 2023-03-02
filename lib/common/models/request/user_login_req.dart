class UserLoginReq {
  String? email;
  String? password;

  UserLoginReq({this.email, this.password});

  factory UserLoginReq.fromJson(Map<String, dynamic> json) => UserLoginReq(
        email: json['email'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
