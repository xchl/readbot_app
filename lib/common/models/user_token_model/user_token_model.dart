import 'access_token.dart';
import 'refresh_token.dart';

class UserTokenModel {
  AccessToken? accessToken;
  RefreshToken? refreshToken;

  UserTokenModel({this.accessToken, this.refreshToken});

  factory UserTokenModel.fromJson(Map<String, dynamic> json) {
    return UserTokenModel(
      accessToken: json['access_token'] == null
          ? null
          : AccessToken.fromJson(json['access_token'] as Map<String, dynamic>),
      refreshToken: json['refresh_token'] == null
          ? null
          : RefreshToken.fromJson(
              json['refresh_token'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'access_token': accessToken?.toJson(),
        'refresh_token': refreshToken?.toJson(),
      };
}
