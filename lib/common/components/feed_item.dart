import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';

/// 按钮列表项
class FeedItemWidget extends StatelessWidget {
  final String title;
  final String? logoUrl;
  final Color? backgroud;
  final bool titleWraped;
  final Function()? onTap;

  const FeedItemWidget({
    Key? key,
    required this.title,
    this.titleWraped = false,
    this.backgroud,
    this.logoUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileWidget(
      // 标题
      title: TextWidget.body1(
        title,
        overflow: titleWraped ? null : TextOverflow.ellipsis,
      ),
    )
        .inkWell(
          onTap: onTap,
        )
        .backgroundColor(backgroud ?? AppColors.background);
  }
}
