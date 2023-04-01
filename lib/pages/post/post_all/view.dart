import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class PostAllPage extends GetView<PostAllController> {
  const PostAllPage({Key? key}) : super(key: key);

  // 导航栏
  AppBar _buildAppBar() {
    return AppBar(
      // 背景透明
      backgroundColor: AppColors.background,
      // 取消阴影
      elevation: 0,
      // 标题栏左侧间距
      titleSpacing: AppSpace.listItem,
      // 搜索栏
      title: InputWidget.search(
        // 提示文字，多语言
        hintText: LocaleKeys.myBtnLanguage.tr,
        // 点击事件
        onTap: controller.onAppBarTap,
        // 只读
        readOnly: true,
      ),
      // 右侧的按钮区
      actions: [
        // 图标
        IconWidget.svg(
          AssetsSvgs.pNotificationsSvg,
          size: 20,
          isDot: true, // 未读消息 小圆点
        )
            .unconstrained() // 去掉约束, appBar 会有个约束下来
            .padding(
              left: AppSpace.listItem,
              right: AppSpace.page,
            ),
      ],
    );
  }

  // 主视图
  Widget _buildView() {
    return ListView.separated(
            separatorBuilder: (_, __) => const Divider(
                  height: 0,
                ),
            itemBuilder: (context, i) {
              final feedItem = controller.feedItems[i];
              return Dismissible(
                background: Container(
                  color: AppColors.primary,
                  child: const Icon(Icons.check),
                ),
                // secondaryBackground: Container(
                //   color: AppColors.secondary,
                //   child: const Icon(Icons.check),
                // ),
                key: ValueKey<int>(feedItem.id),
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    controller.turnToFocus(i);
                  }
                },
                child: PostItemWidget(
                  feedItem: feedItem,
                  feed: feedItem.feed.value!,
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
    return GetBuilder<PostAllController>(
      init: PostAllController(),
      id: "post_all",
      builder: (_) {
        return Scaffold(
          // appBar: _buildAppBar(),
          endDrawer: Drawer(
            backgroundColor: AppColors.primary,
            width: 200.w,
          ),
          body: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (notification.metrics.pixels ==
                  notification.metrics.maxScrollExtent) {
                controller.onLoadMore();
              }
              return false;
            },
            child: RefreshIndicator(
                displacement: 50,
                color: Colors.redAccent,
                backgroundColor: Colors.blue,
                onRefresh: controller.onRefresh,
                child: _buildView()),
          ),
        );
      },
    );
  }
}
