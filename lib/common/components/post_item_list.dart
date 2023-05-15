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
              color:
                  feedItem.isSeen ? AppColors.hideColor : AppColors.titleColor)
          .paddingBottom(AppSpace.listItem)
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
          : DescriptionItem(
                  icon: IconWidget.image(
                    AssetsSvgs.publisher,
                    size: 12.sp,
                  ),
                  text:
                      TextWidget.body2(feed!.title, color: AppColors.hideColor))
              .paddingBottom(AppSpace.seqHorization),
      feedItem.publishTime == null
          ? const SizedBox(
              width: 0,
              height: 0,
            )
          : DescriptionItem(
              icon: IconWidget.image(
                AssetsSvgs.publishTime,
                size: 12.sp,
              ),
              text: TextWidget.body2(displayDatetime(feedItem.publishTime!),
                  color: AppColors.hideColor))
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: <Widget>[
        _buildTextBlock().expanded(),
        feedItem.cover == null
            ? const SizedBox(
                width: 0,
                height: 0,
              )
            : _buildImageBlock()
                .width(AppSize.exploreImageWidth)
                .height(AppSize.exploreImageHeight)
                .paddingLeft(AppSpace.card),
      ].toRow().padding(left: AppSpace.card, right: AppSpace.card),
    ).paddingBottom(AppSpace.listItem);
  }
}
