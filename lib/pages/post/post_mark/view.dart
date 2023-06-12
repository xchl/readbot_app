import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readbot/common/index.dart';

import 'index.dart';

class PostMarkPage extends GetView<PostMarkController> {
  const PostMarkPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return ListView.separated(
            separatorBuilder: (_, __) => const Divider(
                  height: 0,
                ),
            itemBuilder: (context, i) {
              final feedItem = controller.feedItems[i];
              final feed = controller.feed[i];
              return PostItemListWidget(
                feedItem: feedItem,
                feed: feed,
              ).inkWell(onTap: () {
                controller.onTapItem(feedItem, i);
              }).padding(top: AppSpace.listItem);
            },
            itemCount: controller.feedItems.length)
        .paddingHorizontal(AppSpace.seqHorization);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostMarkController>(
      init: PostMarkController(),
      id: "post_mark",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: const SizedBox(),
            toolbarHeight: AppSize.appBarHeight,
            backgroundColor: AppColors.navigationBarColor,
            elevation: AppSize.appBarElevation,
            title: TextWidget.title1(
              LocaleKeys.myMark.tr,
              color: AppColors.titleColor,
            ),
          ),
          body: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification.metrics.extentAfter <
                        MediaQuery.of(context).size.height / 2 &&
                    controller.isLoading == false) {
                  controller.onLoadMore();
                }
                return false;
              },
              child: _buildView().backgroundColor(AppColors.background)),
        );
      },
    );
  }
}
