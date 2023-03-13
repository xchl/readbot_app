import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 按钮列表项
class FeedItemWidget extends StatelessWidget {
  final String title;
  final String logoUrl;
  final Function()? onTap;

  const FeedItemWidget({
    Key? key,
    required this.title,
    required this.logoUrl,
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
        IconWidget.url(logoUrl),
      ].toStack(
        alignment: Alignment.center,
      ),

      // 间距
      leadingSpace: 20.w,

      // 标题
      title: TextWidget.body1(
        title,
        size: 15.sp,
        weight: FontWeight.w400,
      ),
    ).inkWell(
      onTap: onTap,
    );
  }
}
