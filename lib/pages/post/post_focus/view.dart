import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readbot/pages/post/post_focus/widgets/help_item.dart';

import 'index.dart';

class PostFocusPage extends StatefulWidget {
  const PostFocusPage({Key? key}) : super(key: key);

  @override
  State<PostFocusPage> createState() => _PostFocusPageState();
}

class _PostFocusPageState extends State<PostFocusPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _PostFocusPageViewGetX();
  }
}

class _PostFocusPageViewGetX extends GetView<PostFocusController> {
  const _PostFocusPageViewGetX({Key? key}) : super(key: key);

  Widget _buildFocusView() {
    return ListView.builder(
            itemBuilder: (context, i) {
              final feedItem = controller.feedItems[i];
              final feed = controller.feeds[i];
              return PostItemCardWidget(
                feedItem: feedItem,
                feed: feed,
              ).inkWell(onTap: () {
                controller.onTapItem(feedItem, i);
              });
            },
            itemCount: controller.feedItems.length)
        .paddingHorizontal(AppSpace.seqHorization);
  }

  Widget _buildHelpView() {
    return ListView(children: <Widget>[
      SizedBox(
        height: AppSize.helpItemHeight,
        child: HelpItem(
          title: "💡 ${LocaleKeys.myHelpGetStart.tr}",
          url: ConfigService.to.quickStartDocUrl,
        ),
      ),
      const Divider(),
      SizedBox(
        height: AppSize.helpItemHeight,
        child: HelpItem(
          title: "📘 ${LocaleKeys.myHelpDetail.tr}",
          url: ConfigService.to.helpDocUrl,
        ),
      ),
    ]);
  }

  // 主视图
  Widget _buildView() {
    if (controller.isUserConfused) {
      return _buildHelpView();
    } else {
      return _buildFocusView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostFocusController>(
      init: Get.find<PostFocusController>(),
      id: "post_focus",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: AppSize.appBarHeight,
            backgroundColor: AppColors.navigationBarColor,
            elevation: AppSize.appBarElevation,
            title: TextWidget.title1(
              LocaleKeys.focusTitle.tr,
              color: AppColors.titleColor,
            ),
          ),
          body: SafeArea(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification.metrics.extentAfter <
                    MediaQuery.of(context).size.height) {
                  controller.onLoadMore();
                }
                return false;
              },
              child: RefreshIndicator(
                  displacement: AppSpace.refreshDisplacement,
                  color: AppColors.primary,
                  backgroundColor: AppColors.navigationBarColor,
                  onRefresh: controller.onRefresh,
                  child: _buildView().backgroundColor(AppColors.background)),
            ),
          ),
        );
      },
    );
  }
}
