import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 按钮列表项
class FeedItemWidget extends StatelessWidget {
  final String title;
  final String? logoUrl;
  final Color? backgroud;
  final Function()? onTap;

  const FeedItemWidget({
    Key? key,
    required this.title,
    this.backgroud,
    this.logoUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileWidget(
      // 头部图标
      leading: <Widget>[
        // 底部圆形
        Container().tightSize(30.w).decorated(
              // 圆形边框
              borderRadius: BorderRadius.circular(30.w / 2),
            ),
        // 叠加图标
        logoUrl != null
            ? IconWidget.url(
                logoUrl,
              )
            : IconWidget.text(
                title.substring(0, 1),
                color: AppColors.primary,
                size: 20,
              )
      ].toStack(
        alignment: Alignment.center,
      ),

      // 间距
      leadingSpace: 10.w,

      // 标题
      title: TextWidget.body1(
        title,
        size: 15.sp,
        weight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),
    )
        .inkWell(
          onTap: onTap,
        )
        .backgroundColor(backgroud ?? AppColors.background);
  }
}
