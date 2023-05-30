import 'package:readbot/common/index.dart';
import 'package:readbot/pages/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class PostDetailController extends GetxController {
  PostDetailController();

  final GlobalKey webViewKey = GlobalKey();

  bool isEnableReadMode = ConfigService().enableReadMode;
  late bool isInReadMode;
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

  Future<void>? loadHtmlFuture;

  @override
  void onReady() {
    super.onReady();
    loadHtmlFuture = loadHtml();
    _summary(feedItem.summaryAlgo);
    handleRead();
  }

  @override
  void onInit() {
    super.onInit();
    isInReadMode = isEnableReadMode;
  }

  Future<void> loadHtml() async {
    content =
        await DatabaseManager().getContentByFeedItemMd5(feedItem.md5String);
    if (content != null && content!.type == ContentType.html) {
      html = await compute(
          injectCss, HtmlContent(content!.content, ReadModeStyle().css));
    }
  }

  void handleRead() {
    feedItem.isSeen = true;
    DatabaseManager().updateFeedItemNeedSync(feedItem);
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

  Future<void> loadContent() async {
    if (isEnableReadMode && html != null) {
      await webView.loadData(data: html!);
      isInReadMode = true;
    } else {
      await webView.loadUrl(
          urlRequest: URLRequest(url: Uri.parse(feedItem.link!)));
      isInReadMode = false;
    }
    update(['post_detail']);
  }

  void toggleReadMode() {
    isEnableReadMode = !isEnableReadMode;
    loadContent();
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
      DatabaseManager().updateFeedItemNeedSync(feedItem);
      _summary(result);
      debugPrint(result);
    }
  }
}
