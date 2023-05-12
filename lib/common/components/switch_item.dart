import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 按钮列表项
class SwitchItemWidget extends StatelessWidget {
  final String title;
  final bool statu;
  final Color? color;
  final Function(bool) onTap;

  const SwitchItemWidget({
    Key? key,
    required this.title,
    required this.statu,
    this.color = Colors.green,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileWidget(
        title: TextWidget.body1(
          title,
          size: 15.sp,
          weight: FontWeight.w400,
        ),

        // 右侧箭头
        trailing: <Widget>[
          Switch(
            value: statu,
            onChanged: onTap,
            activeColor: Colors.green,
          ).height(30.sp)
        ]);
  }
}
