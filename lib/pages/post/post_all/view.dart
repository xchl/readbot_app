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
              final item = FeedService.to.explorePosts[i];
              return Dismissible(
                background: Container(
                  color: AppColors.primary,
                  child: const Icon(Icons.check),
                ),
                secondaryBackground: Container(
                  color: AppColors.secondary,
                  child: const Icon(Icons.cancel),
                ),
                key: ValueKey<int>(item.postId!),
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    controller.moveExploreToArchive(i);
                  } else {
                    controller.moveExploreToFocus(i);
                  }
                },
                child: PostItemWidget(
                  post: item,
                ).inkWell(onTap: () {
                  controller.onTapItem(item);
                }),
              );
            },
            itemCount: FeedService.to.explorePosts.length)
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
          appBar: _buildAppBar(),
          drawer: Drawer(
            backgroundColor: AppColors.background,
          ),
          body: RefreshIndicator(
              displacement: 50,
              color: Colors.redAccent,
              backgroundColor: Colors.blue,
              onRefresh: controller.onRefresh,
              child: _buildView()),
        );
      },
    );
  }
}
