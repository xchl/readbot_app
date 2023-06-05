import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'index.dart';

class PostDetailPage extends GetView<PostDetailController> {
  const PostDetailPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return Stack(
      children: [
        InAppWebView(
          key: controller.webViewKey,
          initialOptions: controller.options,
          onWebViewCreated: (webController) async {
            controller.webView = webController;
            if (controller.loadHtmlFuture != null) {
              await controller.loadHtmlFuture;
              await controller.loadContent();
            }
          },
          // onScrollChanged: (webController, x, y) {
          //   controller.handleScrollChange(x, y);
          // },
        ),
      ],
    );
  }

  Widget _buildToolBar() {
    return Builder(builder: (context) {
      return BottomAppBar(
          color: AppColors.navigationBarColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              controller.isInReadMode
                  ? ButtonWidget.icon(
                      Icon(
                        Icons.feed_outlined,
                        color: AppColors.textColor,
                        size: AppSize.toolIconSize,
                      ),
                      onTap: () => controller.toggleReadMode())
                  : ButtonWidget.icon(
                      Icon(
                        Icons.public_outlined,
                        color: AppColors.textColor,
                        size: AppSize.toolIconSize,
                      ),
                      onTap: () => controller.toggleReadMode()),
              controller.isMarked
                  ? ButtonWidget.icon(
                      Icon(
                        Icons.star,
                        color: AppColors.marked,
                        size: AppSize.toolIconSize,
                      ),
                      onTap: controller.mark,
                    )
                  : ButtonWidget.icon(
                      Icon(
                        Icons.star_outline,
                        color: AppColors.textColor,
                        size: AppSize.toolIconSize,
                      ),
                      onTap: controller.mark,
                    ),
              ButtonWidget.icon(
                  Icon(
                    Icons.smart_toy_outlined,
                    color: AppColors.textColor,
                    size: AppSize.toolIconSize,
                  ), onTap: () {
                if (controller.isAIReady) {
                  controller.summaryText(redo: false);
                  showCustomModalBottomSheet(
                      context: context,
                      builder: (context) => _buildSummaryView());
                } else {
                  Loading.toast(LocaleKeys.aiServiceNotReady.tr);
                }
              }),
            ],
          ).height(AppSize.toolbarHeight));
    });
  }

  Widget _buildSummaryView() {
    return Column(children: [
      TextWidget.title2(LocaleKeys.aiSummaryTitle.tr)
          .paddingBottom(AppSpace.card),
      Obx(() => controller.summary.isEmpty
          ? TextWidget.body1(LocaleKeys.aiLoading.tr)
          : TextWidget.body1(
              controller.summary,
            ))
    ]).height(AppSize.summaryBoxHeight).paddingAll(AppSpace.card);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostDetailController>(
        init: PostDetailController(),
        id: "post_detail",
        builder: (_) {
          return Scaffold(
              appBar: AppBar(
                toolbarHeight: 0,
                backgroundColor: AppColors.background,
                elevation: AppSize.appBarElevation,
              ),
              body: SafeArea(
                child: _buildView(),
              ),
              bottomNavigationBar: _buildToolBar());
        });
  }
}
