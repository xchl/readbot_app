import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class PostFocusPage extends GetView<PostFocusController> {
  const PostFocusPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return ListView.separated(
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, i) {
              final item = FeedService.to.focusPosts[i];
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
                ),
              );
            },
            itemCount: FeedService.to.focusPosts.length)
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
            elevation: 0,
            //由于title本身是接受一个widget，所以可以直接给他一个自定义的widget。
            title: TextWidget.title1(
              "待读",
              color: AppColors.secondary,
            ),
          ),
          drawer: const Drawer(
            child: Text("左侧边栏"),
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
