/// 常量
class Constants {
  // User
  static const storageProfile = 'profile'; // 用户资料缓存

  // Token
  static const tokenExpiredEpsSecond = Duration(seconds: 10); //Token过期时间判断误差
  static const storageAccessToken = 'access_token'; // 登录成功后 access token
  static const storageRefreshToken = 'refresh_token'; // 登录成功后 refresh token

  // System
  static const feedBoxServerUrl = 'http://127.0.0.1:8000';
  static const storageLanguageCode = 'language_code';
  static const storageThemeCode = 'theme_code';
  static const storageAlreadyOpen = 'already_open'; // 首次打开
  static const pageSizeMobile = 20;
  static const pageSizePC = 50;

  // Feed
  static const existUrlType = "exist";
  static const createdUrlType = "create";
  static const storageLatestFeedId = 'history_latest_feed_id';

  // Post
  static const storageExplorePost = 'history_explore_post';
  static const storageFocusPost = 'history_focus_post';
  static const storageSeenPost = 'history_seen_post';
  static const storageArchivePost = 'history_archive_post';
  static const storageLatestPostId = 'history_latest_post_id';
  static const storagePostCache = 'postCache';
}
