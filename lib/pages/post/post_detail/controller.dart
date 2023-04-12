import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class PostDetailController extends GetxController {
  PostDetailController();

  final GlobalKey webViewKey = GlobalKey();
  bool isReadMode = false;
  double _lastScrollPosition = 0;
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

  FeedItem feedItem = Get.arguments['feedItem'];

  late String? html;

  @override
  void onInit() {
    super.onInit();
    if (feedItem.content != null) {
      html = injectCss(feedItem.content!, ReadModeStyle().css);
    }
  }

  void handleScrollChange(int x, int y) {
    if (y > _lastScrollPosition) {
      // 上滑
      isShowBottomBar = false;
    } else if (y < _lastScrollPosition) {
      // 下滑
      isShowBottomBar = true;
    }
    _lastScrollPosition = y.toDouble();
    update(['post_detail']);
  }

  void toggleReadMode() {
    isReadMode = !isReadMode;
    if (isReadMode && html != null) {
      webView.loadData(data: html!);
    } else {
      webView.loadUrl(urlRequest: URLRequest(url: Uri.parse(feedItem.link!)));
    }
  }
}
