import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 功能栏项
class PostItemCardWidget extends StatelessWidget {
  final FeedItemModel feedItem;
  final FeedModel feed;

  const PostItemCardWidget({
    Key? key,
    required this.feedItem,
    required this.feed,
  }) : super(key: key);

  Widget _buildImageBlock() {
    return feedItem.cover == null
        ? const SizedBox(
            width: 0,
            height: 0,
          )
        : ImageWidget.url(feedItem.cover!);
  }

  Widget _buildTitleBlock() {
    return TextWidget.title3(
      feedItem.title,
      maxLines: 2,
      softWrap: true,
    ).paddingTop(5.h);
  }

  Widget _buildDescriptionBlock() {
    return <Widget>[
      TextWidget.body2(feed.title),
      feedItem.publishTime == null
          ? const SizedBox(
              width: 0,
              height: 0,
            )
          : TextWidget.body2(displayDatetime(feedItem.publishTime!))
              .paddingLeft(10.w),
    ].toRow(crossAxisAlignment: CrossAxisAlignment.start);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: <Widget>[
        _buildTitleBlock(),
        // 图片Block
        _buildImageBlock().padding(top: 5.h, bottom: 5.h),
        // Description Block
        _buildDescriptionBlock(),
      ]
          .toColumn()
          .card(color: AppColors.background, radius: AppRadius.card)
          .padding(left: 5.w, right: 5.w, top: 5.h, bottom: 5.h),
    ).paddingBottom(AppSpace.listItem).paddingTop(AppSpace.listItem);
  }
}
