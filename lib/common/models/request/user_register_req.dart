/// 用户注册请求
class UserRegisterReq {
  String? username;
  String? password;
  String? email;

  UserRegisterReq({
    this.username,
    this.password,
    this.email,
  });

  factory UserRegisterReq.fromJson(Map<String, dynamic> json) {
    return UserRegisterReq(
      username: json['username'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'email': email,
      };
}
