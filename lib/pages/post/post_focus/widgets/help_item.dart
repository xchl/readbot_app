import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readbot/common/index.dart';

class HelpItem extends StatelessWidget {
  final String title;
  final String url;

  const HelpItem({
    Key? key,
    required this.title,
    required this.url,
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
          size: AppSize.arrowSize,
          color: AppColors.hideColor,
        ),
      ],
    ).inkWell(
      onTap: () =>
          Get.toNamed(RouteNames.systemHelpDoc, arguments: {'url': url}),
    );
  }
}
