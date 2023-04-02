import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

/// 功能栏项
class PostItemListWidget extends StatelessWidget {
  final FeedItem feedItem;

  const PostItemListWidget({
    Key? key,
    required this.feedItem,
  }) : super(key: key);

  Widget _buildImageBlock() {
    return feedItem.cover == null
        ? const SizedBox(
            width: 0,
            height: 0,
          )
        : ImageWidget.url(feedItem.cover!);
  }

  Widget _buildTextBlock() {
    return <Widget>[
      TextWidget.title3(
        feedItem.title!,
        maxLines: 2,
        softWrap: true,
      ).paddingBottom(10.h).alignLeft(),
      _buildDescriptionBlock()
    ].toColumn();
  }

  Widget _buildDescriptionBlock() {
    return <Widget>[
      TextWidget.body2(feedItem.feed.value!.name!), // todo
      TextWidget.body2(DateFormat("M/d").format(feedItem.publishTime!))
          .paddingLeft(5.w)
    ].toRow();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: <Widget>[
        // 图片Block
        _buildImageBlock().width(100).height(80).paddingRight(10),
        // Description Block
        _buildTextBlock().expanded(),
      ].toRow().padding(left: 5.w, right: 5.w, top: 5.h, bottom: 5.h),
    ).paddingBottom(AppSpace.listItem).paddingTop(AppSpace.listItem);
  }
}
