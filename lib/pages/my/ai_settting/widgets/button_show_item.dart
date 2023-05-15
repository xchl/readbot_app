import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 按钮列表项
class ButtonShowItemWidget extends StatelessWidget {
  final String title;
  final String content;
  final Function()? onTap;

  const ButtonShowItemWidget({
    Key? key,
    required this.title,
    required this.content,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileWidget(
        // 标题
        leading: TextWidget.body1(
          title,
        ),
        leadingSpace: AppSpace.seqx2Horization,

        // 右侧箭头
        title: TextWidget.body1(
          content,
        )).inkWell(
      onTap: onTap,
    );
  }
}
