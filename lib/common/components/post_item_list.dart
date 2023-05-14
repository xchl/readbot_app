import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 功能栏项
class PostItemListWidget extends StatelessWidget {
  final FeedItemModel feedItem;
  final FeedModel? feed;

  const PostItemListWidget(
      {Key? key, required this.feedItem, required this.feed})
      : super(key: key);

  Widget _buildImageBlock() {
    return ImageWidget.url(feedItem.cover!);
  }

  Widget _buildTextBlock() {
    return <Widget>[
      TextWidget.title3(feedItem.title,
              maxLines: 2,
              softWrap: true,
              color: feedItem.isSeen
                  ? AppColors.seenTextColor
                  : AppColors.textColor)
          .paddingBottom(10.h)
          .alignLeft(),
      _buildDescriptionBlock()
    ].toColumn();
  }

  Widget _buildDescriptionBlock() {
    return <Widget>[
      feed == null
          ? const SizedBox(
              width: 0,
              height: 0,
            )
          : TextWidget.body2(feed!.title,
              color: feedItem.isSeen
                  ? AppColors.seenTextColor
                  : AppColors.textColor),
      feedItem.publishTime == null
          ? const SizedBox(
              width: 0,
              height: 0,
            )
          : TextWidget.body2(displayDatetime(feedItem.publishTime!),
                  color: feedItem.isSeen
                      ? AppColors.seenTextColor
                      : AppColors.textColor)
              .paddingLeft(10.w),
    ].toRow();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: <Widget>[
        // 图片Block
        feedItem.cover == null
            ? const SizedBox(
                width: 0,
                height: 0,
              )
            : _buildImageBlock().width(100).height(80).paddingRight(10),
        // Description Block
        _buildTextBlock().expanded(),
      ].toRow().padding(left: 5.w, right: 5.w, top: 5.h, bottom: 5.h),
    ).paddingBottom(AppSpace.listItem).paddingTop(AppSpace.listItem);
  }
}
