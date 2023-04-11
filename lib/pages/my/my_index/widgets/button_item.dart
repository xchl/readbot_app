import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 按钮列表项
class ButtonItemWidget extends StatelessWidget {
  final String title;
  final Color? color;
  final Function()? onTap;

  const ButtonItemWidget({
    Key? key,
    required this.title,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = this.color ?? AppColors.primary;
    return ListTileWidget(
      // 标题
      title: TextWidget.body1(
        title,
        size: 15.sp,
        weight: FontWeight.w400,
      ),

      // 右侧箭头
      trailing: <Widget>[
        IconWidget.icon(
          Icons.arrow_forward_ios,
          size: 14.w,
          color: AppColors.outline,
        ),
      ],
    ).inkWell(
      onTap: onTap,
    );
  }
}
