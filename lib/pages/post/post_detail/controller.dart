import 'dart:convert';

import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/common/values/js.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
// #enddocregion platform_imports

class PostDetailController extends GetxController {
  PostDetailController();
  late HeadlessInAppWebView headlessWebView;
  // late InAppWebView inAppWebView;
  InAppWebViewController? webViewController;

  String? htmlBody;

  FeedItem feedItem = Get.arguments['feedItem'];

  @override
  void onInit() async {
    headlessWebView = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(feedItem.link!)),
      onLoadStop: (controller, url) async {
        if (htmlBody == null) {
          await controller.injectJavascriptFileFromAsset(
              assetFilePath: AssetsJs.readability);
          var result = await controller.evaluateJavascript(source: '''
          (function(){
                const readability = new Readability(document);
                const article = readability.parse();
                return JSON.stringify(article);
          })()
        ''');
          Map<String, dynamic> article = jsonDecode(result as String);
          generateHtmlBody(article['title'], article['content']);
          update(['post_detail']);
        }
      },
    );
    await headlessWebView.run();
    super.onInit();
  }

  // @override
  // void onInit() async {
  //   inAppWebView = InAppWebView(
  //     initialUrlRequest: URLRequest(url: Uri.parse(feedItem.link!)),
  //     onLoadStop: (controller, url) async {
  //       if (htmlBody == null) {
  //         await controller.injectJavascriptFileFromAsset(
  //             assetFilePath: AssetsJs.readability);
  //         var result = await controller.evaluateJavascript(source: '''
  //         (function(){
  //               const readability = new Readability(document);
  //               const article = readability.parse();
  //               return JSON.stringify(article);
  //         })()
  //       ''');
  //         Map<String, dynamic> article = jsonDecode(result as String);
  //         generateHtmlBody(article['title'], article['content']);
  //         update(['post_detail']);
  //       }
  //     },
  //   );
  //   super.onInit();
  // }

  void generateHtmlBody(String title, String content) {
    htmlBody = '''
          <!DOCTYPE html>
          <html>
          <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style>
              body { font-family: sans-serif; }
            </style>
          </head>
          <body>
            <h1>$title</h1>
            $content
          </body>
          </html>)''';
  }

  @override
  void onClose() {
    // headlessWebView.dispose();
    super.onClose();
  }
}

// class PostDetailController extends GetxController {
//   PostDetailController();

//   late WebViewController webViewController;

//   // 文章, 获取路由传递参数
//   FeedItem feedItem = Get.arguments['feedItem'];

//   _initData() {
//     update(["post_detail"]);
//   }

//   void onTap() {}

//   @override
//   void onInit() {
//     super.onInit();
//     // #docregion platform_features
//     late final PlatformWebViewControllerCreationParams params;
//     if (WebViewPlatform.instance is WebKitWebViewPlatform) {
//       params = WebKitWebViewControllerCreationParams(
//         allowsInlineMediaPlayback: true,
//         mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
//       );
//     } else {
//       params = const PlatformWebViewControllerCreationParams();
//     }

//     final WebViewController controller =
//         WebViewController.fromPlatformCreationParams(params);
//     // #enddocregion platform_features

//     controller
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(AppColors.background)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             debugPrint('WebView is loading (progress : $progress%)');
//           },
//           onPageStarted: (String url) {
//             debugPrint('Page started loading: $url');
//           },
//           onPageFinished: (String url) async {
//             debugPrint('Page finished loading: $url');
//             await _runReadability();
//           },
//           onWebResourceError: (WebResourceError error) {
//             debugPrint('''
//               Page resource error:
//                 code: ${error.errorCode}
//                 description: ${error.description}
//                 errorType: ${error.errorType}
//                 isForMainFrame: ${error.isForMainFrame}
//           ''');
//           },
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               debugPrint('blocking navigation to ${request.url}');
//               return NavigationDecision.prevent;
//             }
//             debugPrint('allowing navigation to ${request.url}');
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..addJavaScriptChannel(
//         'Toaster',
//         onMessageReceived: (JavaScriptMessage message) {
//           ScaffoldMessenger.of(Get.context!).showSnackBar(
//             SnackBar(content: Text(message.message)),
//           );
//         },
//       )
//       ..loadRequest(Uri.parse(feedItem.link!));

//     webViewController = controller;
//   }

//   @override
//   void onReady() {
//     super.onReady();
//     _initData();
//   }

//   // run Readability
//   Future<void> _runReadability() async {
//     final String js = await rootBundle.loadString(AssetsJs.readability);
//     debugPrint(js);
//     await webViewController.runJavaScript(js);
//     // var result = await webViewController.runJavaScriptReturningResult('''
//     //     (function(){
//     //           const readability = new Readability(document);
//     //           const article = readability.parse();
//     //           return JSON.stringify(article);
//     //     })()
//     // ''');
//     await webViewController.runJavaScript('''
//       (function(){
//             const readability = new Readability(document);
//             const article = readability.parse();
//             return JSON.stringify(article);
//       })()
//     ''');
//     Map<String, dynamic> article = jsonDecode(result as String);
//     debugPrint(article['title']);
//     debugPrint(article['content']);

//     // webViewController.loadHtmlString('''
//     //       <!DOCTYPE html>
//     //       <html>
//     //       <head>
//     //         <meta charset="utf-8">
//     //         <meta name="viewport" content="width=device-width, initial-scale=1.0">
//     //         <style>
//     //           body { font-family: sans-serif; }
//     //         </style>
//     //       </head>
//     //       <body>
//     //         <h1>${article['title']}</h1>
//     //         ${article['content']}
//     //       </body>
//     //       </html>
//     //     ''');
//   }

//   // @override
//   // void onClose() {
//   //   super.onClose();
//   // }
// }
