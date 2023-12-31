import 'package:readbot/common/index.dart';
import 'package:readbot/pages/index.dart';
import 'package:readbot/pages/post/post_drawer/index.dart';
import 'package:flutter/material.dart';
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
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextWidget.body1(
                      LocaleKeys.turnToFocusTip.tr,
                      color: AppColors.onPrimary,
                    ).paddingLeft(AppSpace.seqx2Horization),
                  ),
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
                  feed: feed,
                ).inkWell(onTap: () {
                  controller.onTapItem(feedItem, i);
                }).padding(top: AppSpace.listItem),
              );
            },
            itemCount: controller.feedItems.length)
        .paddingHorizontal(AppSpace.seqHorization);
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
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: IconWidget.image(AssetsIcons.filter),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              ),
            ],
            toolbarHeight: AppSize.appBarHeight,
            backgroundColor: AppColors.navigationBarColor,
            elevation: AppSize.appBarElevation,
            title: TextWidget.title1(
              NoticeService.to.isFetching
                  ? LocaleKeys.exploreTitleFetching.tr
                  : LocaleKeys.exploreTitle.tr,
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
              child: RefreshIndicator(
                  displacement: AppSpace.refreshDisplacement,
                  color: AppColors.primary,
                  backgroundColor: AppColors.navigationBarColor,
                  onRefresh: controller.onRefresh,
                  child: _buildView().backgroundColor(AppColors.background))),
        );
      },
    );
  }
}
