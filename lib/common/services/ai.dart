import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:readbot/common/index.dart';
import 'package:readbot/pages/index.dart';

class AIQueryService extends GetxService {
  static Future<String?> summaryHtml(String html) async {
    String? text = await compute(extractHtmlText, html);
    if (text == null) {
      Loading.toast(LocaleKeys.pageNotSupportAI.tr);
      return null;
    }
    String? result = await summaryContent(text);
    return result;
  }

  static Future<String?> summaryContent(String content) async {
    String? result = await AiApi.summary(content);
    return result;
  }

  static Future<void> summaryFeedItems(List<FeedItemModel> feedItems) async {
    for (var feedItem in feedItems) {
      if (feedItem.summaryAlgo != null) continue;
      ContentModel? content =
          await DatabaseManager().getContentByFeedItemMd5(feedItem.md5String);
      if (content == null) continue;
      if (content.type == ContentType.html) {
        String? summary = await summaryHtml(content.content);
        if (summary == null) continue;
        feedItem.summaryAlgo = summary;
        debugPrint(summary);
        await DatabaseManager().updateFeedItemNeedSync(feedItem);
        // TODO 如何写更好？
        Get.find<PostFocusController>().refreshCurrentPage();
        await Future.delayed(
            const Duration(seconds: Constants.requestIntervalSecond));
      }
    }
  }
}
