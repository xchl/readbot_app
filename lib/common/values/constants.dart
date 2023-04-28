/// 常量
class Constants {
  // User
  static const storageProfile = 'profile'; // 用户资料缓存

  // Token
  static const tokenExpiredEpsSecond = Duration(seconds: 10); //Token过期时间判断误差
  static const storageAccessToken = 'access_token'; // 登录成功后 access token
  static const storageRefreshToken = 'refresh_token'; // 登录成功后 refresh token

  // System
  static const storageLanguageCode = 'language_code';
  static const storageThemeCode = 'theme_code';
  static const storageAlreadyOpen = 'already_open'; // 首次打开
  static const pageSizeMobile = 20;
  static const pageSizePC = 50;
  static const clientInfo = 'client_info';

  // Feed
  static const existUrlType = "exist";
  static const createdUrlType = "create";
  static const storageLatestFeedId = 'history_latest_feed_id';
  static const periodicFetchTask = 'readbot.periodicFetchTask';
  static const feedUpdateHour = 2;
  static const syncTimeStamp = 'syncTimeStamp';

  // Post
  static const storageExplorePost = 'history_explore_post';
  static const storageFocusPost = 'history_focus_post';
  static const storageSeenPost = 'history_seen_post';
  static const storageArchivePost = 'history_archive_post';
  static const storageLatestPostId = 'history_latest_post_id';
  static const storagePostCache = 'postCache';

  // Config
  static const configFile = 'assets/configs/config.json';
  static const serverUrlField = 'server_url';
  static const privacyUrlField = 'privacy_policy_url';
}
