import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/pages/index.dart';
import 'package:feed_inbox_app/pages/post/post_drawer/widgets/feed_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class PostDrawerPage extends GetView<PostDrawerController> {
  const PostDrawerPage(this.subPage, {Key? key, this.backgroud, this.width})
      : super(key: key);

  final SubPage subPage;
  final Color? backgroud;
  final double? width;

  Widget _buildPostExploreDrawer() {
    return FeedFilterWidget(controller.feedGroupedByGroup);
  }

  Widget _buildPostFocusDrawer() {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[Text('Focus')],
    );
  }

  // 主视图
  Widget _buildView() {
    switch (subPage) {
      case SubPage.focus:
        return _buildPostFocusDrawer();
      case SubPage.explore:
        return _buildPostExploreDrawer();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostDrawerController>(
        init: PostDrawerController(subPage),
        id: "post_drawer",
        builder: (_) {
          return Drawer(
              width: width ?? 150.w,
              backgroundColor: backgroud ?? AppColors.onPrimary,
              child: _buildView());
        });
  }
}
