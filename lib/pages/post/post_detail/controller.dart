import 'package:readbot/common/index.dart';
import 'package:readbot/pages/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class PostDetailController extends GetxController {
  PostDetailController();

  final GlobalKey webViewKey = GlobalKey();

  bool isReadMode = ConfigService().enableReadMode;
  bool get isReadAble => content != null;

  // double _lastScrollPosition = 0;
  // final double _scrollThreshhold = 20;

  bool isShowBottomBar = true;
  late InAppWebViewController webView;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
        transparentBackground: true,
        horizontalScrollBarEnabled: false,
        cacheEnabled: true),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  FeedItemModel feedItem = Get.arguments['feedItem'];
  PageType fromPage = Get.arguments['fromPage'];

  ContentModel? content;

  String? html;

  final RxString _summary = "".obs;

  String get summary => _summary.value;

  @override
  void onReady() async {
    super.onReady();
    content =
        await DatabaseManager().getContentByFeedItemMd5(feedItem.md5String);
    if (content != null && content!.type == ContentType.html) {
      html = await compute(
          injectCss, HtmlContent(content!.content, ReadModeStyle().css));
    }
    _summary(feedItem.summaryAlgo);
    loadContent();
    handleRead();
  }

  void handleRead() async {
    feedItem.isSeen = true;
    DatabaseManager().updateFeedItem(feedItem);
    if (fromPage == PageType.focus) {
      Get.find<PostFocusController>().handleRead(feedItem);
    }
    if (fromPage == PageType.explore) {
      Get.find<PostAllController>().handleRead(feedItem);
    }
  }

  // void handleScrollChange(int x, int y) {
  //   double delta = (y - _lastScrollPosition);
  //   if (delta > _scrollThreshhold) {
  //     // 上滑
  //     isShowBottomBar = false;
  //     _lastScrollPosition = y.toDouble();
  //     update(['post_detail']);
  //   } else if (delta < -_scrollThreshhold) {
  //     // 下滑
  //     isShowBottomBar = true;
  //     _lastScrollPosition = y.toDouble();
  //     update(['post_detail']);
  //   }
  // }

  void loadContent() {
    if (isReadMode && html != null) {
      webView.loadData(data: html!);
    } else {
      webView.loadUrl(urlRequest: URLRequest(url: Uri.parse(feedItem.link!)));
    }
  }

  void toggleReadMode() {
    isReadMode = !isReadMode;
    loadContent();
    update(['post_detail']);
  }

  void summaryText({required bool redo}) async {
    if (!redo && summary.isNotEmpty) {
      return;
    }
    if (!ConfigService.to.isAIReady()) {
      Loading.toast(LocaleKeys.aiServiceNotReady.tr);
      return;
    }
    if (html == null) {
      Loading.toast(LocaleKeys.pageNotSupportAI.tr);
      return;
    }

    String? result = await AIQueryService.summaryHtml(html!);

    if (result != null) {
      feedItem.summaryAlgo = result;
      DatabaseManager().updateFeedItem(feedItem);
      _summary(result);
      debugPrint(result);
    }
  }
}
