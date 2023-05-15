import 'package:get/get.dart';
import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 功能栏项
class PostItemCardWidget extends StatelessWidget {
  final FeedItemModel feedItem;
  final FeedModel? feed;

  const PostItemCardWidget({
    Key? key,
    required this.feedItem,
    required this.feed,
  }) : super(key: key);

  Widget _buildImageBlock() {
    return feedItem.cover == null
        ? const SizedBox()
        : ImageWidget.url(
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
              .paddingRight(AppSpace.seqx2Horization),
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
            _buildImageBlock().padding(
                top: AppSpace.seqHorization, bottom: AppSpace.listItem),
            _buildTitleBlock().padding(
                left: AppSpace.card,
                right: AppSpace.card,
                bottom: AppSpace.listItem),
            _buildDescriptionBlock().padding(
                left: AppSpace.card,
                right: AppSpace.card,
                bottom: AppSpace.listItem),
            feedItem.summaryAlgo == null
                ? const SizedBox(
                    width: 0,
                    height: 0,
                  )
                : _buildSummaryBlock().padding(
                    left: AppSpace.card,
                    right: AppSpace.card,
                    bottom: AppSpace.listItem),
          ].toColumn().card(color: AppColors.background, radius: AppRadius.card)
        ],
      ).paddingAll(AppSpace.page),
    );
  }
}
