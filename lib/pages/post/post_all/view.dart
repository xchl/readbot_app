import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/pages/index.dart';
import 'package:feed_inbox_app/pages/post/post_drawer/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PostAllPage extends GetView<PostAllController> {
  const PostAllPage({Key? key}) : super(key: key);

  Widget _buildFeedAddFromUrlForm() {
    return Form(
      key: controller.urlFromKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // url
        TextFormWidget(
          autofocus: true,
          keyboardType: TextInputType.url,
          controller: controller.urlController,
          labelText: LocaleKeys.feedAddDesc.tr,
        ).paddingBottom(30),

        // 添加按钮
        ButtonWidget.text(
          LocaleKeys.feedAddBtn.tr,
          onTap: controller.onAddFeed,
        ).paddingBottom(AppSpace.listRow.w),
      ].toColumn(),
    ).paddingAll(AppSpace.card).height(200);
  }

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
    return GetBuilder<PostAllController>(
      init: PostAllController(),
      id: "post_all",
      builder: (_) {
        return Scaffold(
          endDrawer: const PostDrawerPage(SubPage.explore),
          onEndDrawerChanged: controller.onEndDrawerChanged,
          appBar: AppBar(
            toolbarHeight: 44.h,
            backgroundColor: AppColors.background,
            elevation: 0.1,
            title: TextWidget.title1(
              LocaleKeys.exploreTitle.tr,
              color: AppColors.secondary,
            ),
            // TODO 抽象出一个widget
            actions: [
              PopupMenuButton(
                icon: IconWidget.svg(
                  AssetsSvgs.plusLgSvg,
                  color: AppColors.secondary,
                ).paddingRight(AppSpace.listItem),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: FeedAddButtonFunc.addFromUrl,
                    child: TextWidget.body1(
                      LocaleKeys.feedAddFromUrl.tr,
                      color: AppColors.secondary,
                    ),
                  ),
                  PopupMenuItem(
                    value: FeedAddButtonFunc.importFromOpml,
                    child: TextWidget.body1(
                      LocaleKeys.feedAddFromOpml.tr,
                      color: AppColors.secondary,
                    ),
                  ),
                ],
                onSelected: (value) {
                  switch (value) {
                    case FeedAddButtonFunc.addFromUrl:
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return _buildFeedAddFromUrlForm();
                          });
                      break;
                    case FeedAddButtonFunc.importFromOpml:
                      controller.onImportFromOpml();
                  }
                },
              )
            ],
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
