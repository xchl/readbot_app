import 'package:get/get.dart';
import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';

/// 功能栏项
class PostItemCardWidget extends StatelessWidget {
  final FeedItemModel feedItem;
  final FeedModel? feed;

  const PostItemCardWidget({
    Key? key,
    required this.feedItem,
    required this.feed,
  }) : super(key: key);

  // TODO:加载失败处理
  Widget _buildImageBlock() {
    return ImageWidget.url(
      feedItem.cover!,
      height: AppSize.focusImageHeight,
    );
  }

  Widget _buildTitleBlock() {
    return TextWidget.title3(
      feedItem.title,
      maxLines: 3,
      softWrap: true,
      color: feedItem.isSeen ? AppColors.hideColor : AppColors.titleColor,
    ).alignLeft();
  }

  Widget _buildDescriptionBlock() {
    return <Widget>[
      if (feed != null)
        DescriptionItem(
                icon: IconWidget.image(
                  AssetsIcons.publisher,
                  size: AppSize.body3,
                ),
                text: TextWidget.body2(feed!.title, color: AppColors.hideColor))
            .paddingRight(AppSpace.seqx2Horization),
      if (feedItem.publishTime != null)
        DescriptionItem(
            icon:
                IconWidget.image(AssetsIcons.publishTime, size: AppSize.body3),
            text: TextWidget.body2(displayDatetime(feedItem.publishTime!),
                color: AppColors.hideColor))
    ].toRow(crossAxisAlignment: CrossAxisAlignment.center);
  }

  Widget _buildSummaryBlock() {
    return Column(
      children: [
        TextWidget.body1(
          LocaleKeys.summaryContent.tr,
          color: feedItem.isSeen ? AppColors.hideColor : AppColors.titleColor,
        ).alignLeft().paddingBottom(AppSpace.listItem),
        TextWidget.body2(
          feedItem.summaryAlgo ?? '',
          softWrap: true,
          maxLines: null,
          color: AppColors.hideColor,
        ).alignLeft(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          <Widget>[
            if (feedItem.cover != null)
              _buildImageBlock().padding(bottom: AppSpace.listItem),
            _buildTitleBlock()
                .paddingVertical(AppSpace.listItem)
                .paddingHorizontal(AppSpace.card),
            _buildDescriptionBlock()
                .paddingVertical(AppSpace.listItem)
                .paddingHorizontal(AppSpace.card),
            if (feedItem.summaryAlgo != null)
              _buildSummaryBlock()
                  .paddingVertical(AppSpace.card)
                  .paddingHorizontal(AppSpace.card),
          ].toColumn().card(color: AppColors.background, radius: AppRadius.card)
        ],
      ).paddingAll(AppSpace.page),
    );
  }
}
