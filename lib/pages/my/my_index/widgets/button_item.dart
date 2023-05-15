import 'package:readbot/common/index.dart';
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
    return ListTileWidget(
      // 标题
      title: TextWidget.body1(
        title,
      ),

      // 右侧箭头
      trailing: <Widget>[
        IconWidget.icon(
          Icons.arrow_forward_ios,
          size: 14.sp,
          color: AppColors.hideColor,
        ),
      ],
    ).inkWell(
      onTap: onTap,
    );
  }
}
