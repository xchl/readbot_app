import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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

  // 主视图
  Widget _buildView() {
    return ListView.separated(
            separatorBuilder: (_, __) => const Divider(
                  height: 0,
                ),
            itemBuilder: (context, i) {
              final feedItem = controller.feedItems[i];
              final feed = controller.feeds[i];
              return PostItemListWidget(
                feedItem: feedItem,
                feed: feed,
              ).inkWell(onTap: () {
                controller.onTapItem(feedItem, i);
              });
            },
            itemCount: controller.feedItems.length)
        .paddingLeft(5.w)
        .paddingRight(5.w)
        .backgroundColor(AppColors.background);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostFocusController>(
      init: Get.find<PostFocusController>(),
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
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
