import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class PostDetailController extends GetxController {
  PostDetailController();

  final GlobalKey webViewKey = GlobalKey();
  bool isReadMode = false;
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
  ContentModel? content = Get.arguments['content'];

  String? html;

  @override
  void onInit() async {
    super.onInit();
    if (content != null && content!.type == ContentType.html) {
      html = injectCss(content!.content, ReadModeStyle().css);
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

  void toggleReadMode() {
    isReadMode = !isReadMode;
    if (isReadMode && html != null) {
      webView.loadData(data: html!);
    } else {
      webView.loadUrl(urlRequest: URLRequest(url: Uri.parse(feedItem.link!)));
    }
  }
}
