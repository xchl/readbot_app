import 'package:readbot/common/index.dart';
import 'package:readbot/pages/index.dart';
import 'package:readbot/pages/post/post_drawer/widgets/feed_filter.dart';
import 'package:flutter/material.dart';
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
  bool get wantKeepAlive => false;

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
                headerValue: e.key,
                expandedValue: e.value
                    .map((e) => FeedItemWidget(
                          title: e.title,
                          backgroud: e.url == controller.selectedFeed
                              ? AppColors.primary.withOpacity(0.2)
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
        // init: Get.find<PostDrawerController>(tag: 'explore'),
        init: PostDrawerController(PageType.explore),
        id: "post_drawer",
        builder: (_) {
          return Drawer(
              width: AppSize.drawerWidth,
              backgroundColor: AppColors.background,
              child: SafeArea(child: _buildView()));
        });
  }
}
