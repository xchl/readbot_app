import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class PostFocusPage extends GetView<PostFocusController> {
  const PostFocusPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return ListView.builder(
            // separatorBuilder: (_, __) => const Divider(
            //       height: 0,
            //     ),
            itemBuilder: (context, i) {
              final feedItem = controller.feedItems[i];
              final feed = controller.feeds[i];
              return Dismissible(
                background: Container(
                  color: AppColors.primary,
                  child: const Icon(Icons.check),
                ),
                secondaryBackground: Container(
                  color: AppColors.secondary,
                  child: const Icon(Icons.cancel),
                ),
                key: ValueKey<int>(feedItem.id),
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                  } else {}
                },
                child: PostItemListWidget(
                  feedItem: feedItem,
                  feed: feed!,
                ).inkWell(onTap: () {
                  controller.onTapItem(feedItem);
                }),
              );
            },
            itemCount: controller.feedItems.length)
        .paddingLeft(5.w)
        .paddingRight(5.w)
        .backgroundColor(AppColors.background);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostFocusController>(
      init: PostFocusController(),
      id: "post_focus",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 44.h,
            backgroundColor: AppColors.background,
            elevation: 0.1,
            title: TextWidget.title1(
              LocaleKeys.focusTitle.tr,
              color: AppColors.secondary,
            ),
            actions: [
              // 图标
              IconWidget.svg(
                AssetsSvgs.plusLgSvg,
              ).paddingRight(AppSpace.listItem)
            ],
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
