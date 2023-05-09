import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/pages/index.dart';
import 'package:feed_inbox_app/pages/post/post_drawer/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PostAllPage extends StatefulWidget {
  const PostAllPage({Key? key}) : super(key: key);

  @override
  State<PostAllPage> createState() => _PostAllPageState();
}

class _PostAllPageState extends State<PostAllPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _PostAllPageViewGetX();
  }
}

class _PostAllPageViewGetX extends GetView<PostAllController> {
  const _PostAllPageViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return ListView.separated(
            separatorBuilder: (_, __) => const Divider(
                  height: 0,
                ),
            itemBuilder: (context, i) {
              final feedItem = controller.feedItems[i];
              final feed = controller.feed[i];
              return Dismissible(
                background: Container(
                  color: AppColors.primary,
                  child: const Icon(Icons.check),
                ),
                key: ValueKey<int>(feedItem.id),
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    controller.turnToFocus(i);
                  }
                },
                direction: DismissDirection.startToEnd,
                child: PostItemListWidget(
                  feedItem: feedItem,
                  feed: feed!, // TODO
                ).inkWell(onTap: () {
                  controller.onTapItem(feedItem, i);
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
      init: Get.find<PostAllController>(),
      id: "post_all",
      builder: (_) {
        return Scaffold(
          endDrawer: const PostDrawerPage(PageType.explore),
          onEndDrawerChanged: controller.onEndDrawerChanged,
          appBar: AppBar(
            toolbarHeight: 44.h,
            backgroundColor: AppColors.background,
            elevation: 0.1,
            title: TextWidget.title1(
              LocaleKeys.exploreTitle.tr,
              color: AppColors.secondary,
            ),
          ),
          body: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (notification.metrics.pixels >
                  notification.metrics.maxScrollExtent / 2) {
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
