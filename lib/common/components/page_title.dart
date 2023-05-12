import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';

// 页面标题 组件
class PageTitleWithDescWidget extends StatelessWidget {
  /// 标题
  final String title;

  /// 说明
  final String desc;

  const PageTitleWithDescWidget({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      TextWidget.title1(title),
      TextWidget.body2(desc),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
        )
        .padding(
          top: AppSpace.page,
          bottom: AppSpace.titleContent,
        );
  }
}
