import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/pages/index.dart';
import 'package:feed_inbox_app/pages/post/post_drawer/widgets/feed_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class PostDrawerPage extends StatefulWidget {
  const PostDrawerPage(this.subPage, {Key? key}) : super(key: key);

  final PageType subPage;

  @override
  State<PostDrawerPage> createState() => _PostDrawerPageState();
}

class _PostDrawerPageState extends State<PostDrawerPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _PostDrawerPageViewGetX(widget.subPage);
  }
}

class _PostDrawerPageViewGetX extends GetView<PostDrawerController> {
  const _PostDrawerPageViewGetX(this.subPage, {Key? key}) : super(key: key);

  final PageType subPage;

  Widget _buildPostExploreDrawer() {
    List<ExpansionPanelListItem<String, FeedItemWidget>> items =
        controller.feedGroupedByGroup.entries
            .map((e) => ExpansionPanelListItem(
                headerValue: e.key.name, // TODO 优化代码
                expandedValue: e.value
                    .map((e) => FeedItemWidget(
                          title: e.title,
                          logoUrl: e.logo,
                          backgroud: e.url == controller.selectedFeed
                              ? AppColors.primary.withOpacity(0.1)
                              : null,
                          onTap: () => controller.onFeedSelect(e.url),
                        ))
                    .toList()))
            .toList();
    return FeedFilterWidget(items);
  }

  Widget _buildPostFocusDrawer() {
    return ListView(
      padding: EdgeInsets.zero,
      children: const <Widget>[Text('Focus')],
    );
  }

  // 主视图
  Widget _buildView() {
    switch (subPage) {
      case PageType.focus:
        return _buildPostFocusDrawer();
      case PageType.explore:
        return _buildPostExploreDrawer();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostDrawerController>(
        init: Get.find<PostDrawerController>(tag: 'explore'),
        id: "post_drawer",
        builder: (_) {
          return Drawer(
              width: 150.w,
              backgroundColor: AppColors.onPrimary,
              child: _buildView());
        });
  }
}
