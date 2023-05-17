import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';

/// 功能栏项
class BarItemWidget extends StatelessWidget {
  final String title;
  final String svgPath;

  const BarItemWidget({
    Key? key,
    required this.title,
    required this.svgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 图标
      IconWidget.svg(
        svgPath,
        color: AppColors.primary,
      ).paddingBottom(AppSize.iconTextSmail),

      // 标题
      TextWidget.body1(
        title,
      ),
    ].toColumn();
  }
}
