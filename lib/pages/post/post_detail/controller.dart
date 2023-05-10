import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class PostDetailController extends GetxController {
  PostDetailController();

  final GlobalKey webViewKey = GlobalKey();

  bool isReadMode = ConfigService().enableReadMode;

  double _lastScrollPosition = 0;
  final double _scrollThreshhold = 20;
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
  // TODO 需要加载的时候再加载
  ContentModel? content = Get.arguments['content'];
  PageType fromPage = Get.arguments['fromPage'];

  String? html;

  @override
  void onReady() {
    super.onReady();
    if (content != null && content!.type == ContentType.html) {
      //TODO 性能是否有问题
      html = injectCss(content!.content, ReadModeStyle().css);
    }
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

  void handleScrollChange(int x, int y) {
    double delta = (y - _lastScrollPosition);
    if (delta > _scrollThreshhold) {
      // 上滑
      isShowBottomBar = false;
      _lastScrollPosition = y.toDouble();
      update(['post_detail']);
    } else if (delta < -_scrollThreshhold) {
      // 下滑
      isShowBottomBar = true;
      _lastScrollPosition = y.toDouble();
      update(['post_detail']);
    }
  }

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
  }
}
