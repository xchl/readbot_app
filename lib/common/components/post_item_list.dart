import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';

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
      if (feed != null)
        DescriptionItem(
            icon: IconWidget.image(
              AssetsIcons.publisher,
              size: AppSize.body3,
            ),
            text: TextWidget.body2(
              feed!.title,
              color: AppColors.hideColor,
              softWrap: true,
            )).paddingBottom(AppSpace.seqHorization),
      if (feedItem.publishTime != null)
        DescriptionItem(
            icon: IconWidget.image(
              AssetsIcons.publishTime,
              size: AppSize.body3,
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
        if (feedItem.cover != null)
          _buildImageBlock()
              .width(AppSize.exploreImageWidth)
              .height(AppSize.exploreImageHeight)
              .paddingLeft(AppSpace.card),
      ].toRow().padding(left: AppSpace.card, right: AppSpace.card),
    ).paddingBottom(AppSpace.listItem);
  }
}
