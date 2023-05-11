import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'index.dart';

class PostDetailPage extends GetView<PostDetailController> {
  const PostDetailPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return InAppWebView(
      key: controller.webViewKey,
      initialOptions: controller.options,
      onWebViewCreated: (webController) {
        controller.webView = webController;
        controller.loadContent();
      },
      // onScrollChanged: (webController, x, y) {
      //   controller.handleScrollChange(x, y);
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostDetailController>(
        init: PostDetailController(),
        id: "post_detail",
        builder: (_) {
          return Scaffold(
              body: SafeArea(
                child: _buildView(),
              ),
              bottomNavigationBar: BottomAppBar(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ButtonWidget.icon(
                    Icon(
                      Icons.edit,
                      color: AppColors.secondary,
                      size: 30.h,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  ButtonWidget.icon(
                    Icon(
                      Icons.star_outline,
                      color: AppColors.secondary,
                      size: 30.h,
                    ),
                  ).paddingRight(15.w),
                  controller.isReadMode
                      ? ButtonWidget.icon(
                              Icon(
                                Icons.feed_outlined,
                                color: AppColors.secondary,
                                size: 30.h,
                              ),
                              onTap: () => controller.toggleReadMode())
                          .paddingRight(15.w)
                      : ButtonWidget.icon(
                              Icon(
                                Icons.public_outlined,
                                color: AppColors.secondary,
                                size: 30.h,
                              ),
                              onTap: () => controller.toggleReadMode())
                          .paddingRight(15.w),
                  ButtonWidget.icon(
                      Icon(
                        Icons.smart_toy_outlined,
                        color: AppColors.secondary,
                        size: 30.h,
                      ),
                      onTap: () => controller.summaryText())
                ],
              ).height(50.h).padding(left: 15.w, right: 15.w)));
        });
  }
}
