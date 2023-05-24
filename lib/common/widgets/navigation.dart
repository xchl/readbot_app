import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 导航栏数据模型
class NavigationItemModel {
  final String label;
  final String icon;
  final int count;

  NavigationItemModel({
    required this.label,
    required this.icon,
    this.count = 0,
  });
}

/// 导航栏
class BuildNavigation extends StatelessWidget {
  final int currentIndex;
  final List<NavigationItemModel> items;
  final Function(int) onTap;
  final Function(int)? onDoubleTap;

  const BuildNavigation({
    Key? key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
    this.onDoubleTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ws = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      var color = (i == currentIndex) ? AppColors.primary : null;
      var item = items[i];
      ws.add(
        <Widget>[
          // 图标
          IconWidget.image(
            item.icon,
            size: AppSize.navigationItem,
            color: color,
            badgeString: item.count > 0 ? item.count.toString() : null,
          ).paddingBottom(AppSpace.seqVertical),
          // 文字
          TextWidget.body2(
            item.label.tr,
            color: color,
          ),
        ]
            .toColumn(
              mainAxisSize: MainAxisSize.min,
            )
            .onTap(() => onTap(i))
            .onDoubleTap(() {
          if (onDoubleTap != null) onDoubleTap!(i);
        }).expanded(),
      );
    }
    return BottomAppBar(
        color: AppColors.navigationBarColor,
        elevation: AppSize.bottomBarElevation,
        child: ws
            .toRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
            )
            .height(AppSize.navigationHeight));
  }
}
