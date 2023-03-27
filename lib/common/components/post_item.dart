import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/common/pb/readbot_proto/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

/// 功能栏项
class PostItemWidget extends StatelessWidget {
  final Content content;
  final FeedProfile feedProfile;

  const PostItemWidget({
    Key? key,
    required this.content,
    required this.feedProfile,
  }) : super(key: key);

  Widget _buildImageBlock() {
    return const ImageWidget.asset(
      AssetsImages.defaultPng,
    );
  }

  Widget _buildTextBlock() {
    return <Widget>[
      TextWidget.title3(
        content.title,
        maxLines: 2,
        softWrap: true,
      ).paddingBottom(5.h),
      <Widget>[
        TextWidget.body2(feedProfile.name),
        TextWidget.body2(DateFormat("M/d").format(
                DateTime.fromMillisecondsSinceEpoch(
                    content.publishTime.toInt())))
            .paddingLeft(5.w)
      ].toRow()
    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: <Widget>[
        // 图片Block
        _buildImageBlock().width(60),
        // 文字Block
        _buildTextBlock().expanded(),
      ].toRow(),
    ).paddingBottom(AppSpace.listItem).paddingTop(AppSpace.listItem);
  }
}
