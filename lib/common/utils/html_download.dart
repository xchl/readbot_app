import 'dart:async';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HtmlDownloader {
  List<String> urlsToFetch;
  late HeadlessInAppWebView headlessInAppWebView;

  HtmlDownloader(this.urlsToFetch);

  Future<List<String>> download() async {
    List<String> results = [];
    final headlessInAppWebView = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(urlsToFetch.removeAt(0))),
      onWebViewCreated: (controller) {},
      onLoadStop: (controller, url) async {
        String htmlContent = await controller.evaluateJavascript(
            source: "document.documentElement.outerHTML;");

        results.add(htmlContent);

        if (urlsToFetch.isNotEmpty) {
          controller.loadUrl(
              urlRequest: URLRequest(url: Uri.parse(urlsToFetch.removeAt(0))));
        }
      },
    );
    await headlessInAppWebView.run();
    headlessInAppWebView.dispose();
    return results;
  }
}
