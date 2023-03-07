import 'package:feed_inbox_app/common/index.dart';

/// feed api
class FeedApi {
  /// Profile
  static Future<FeedInfo> addExistSingle(feedInfo) async {
    var res = await FeedBoxHttpService.to
        .post('/feed/add/${Constants.existUrlType}', data: feedInfo);
    return FeedInfo.fromJson(res.data);
  }
}
