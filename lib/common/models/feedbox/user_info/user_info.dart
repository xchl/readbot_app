import 'basic_profile.dart';

class UserInfo {
  BasicProfile? basicProfile;

  UserInfo({this.basicProfile});

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        basicProfile: json['basic_profile'] == null
            ? null
            : BasicProfile.fromJson(
                json['basic_profile'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'basic_profile': basicProfile?.toJson(),
      };
}
