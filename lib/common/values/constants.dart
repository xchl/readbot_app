/// 常量
class Constants {
  // 本地存储key
  static const storageLanguageCode = 'language_code';

  static const feedBoxServerUrl = 'http://127.0.0.1:8000';

  static const storageThemeCode = 'theme_code';

  static const storageAlreadyOpen = 'already_open'; // 首次打开

  static const storageAccessToken = 'access_token'; // 登录成功后 access token
  static const storageRefreshToken = 'refresh_token'; // 登录成功后 refresh token

  static const storageProfile = 'profile'; // 用户资料缓存

  // Feed
  static const existUrlType = "exist";
  static const createdUrlType = "create";
}
