import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';

/// 按钮列表项
class SwitchItemWidget extends StatelessWidget {
  final String title;
  final bool statu;
  final Color color = AppColors.switchColor;
  final Function(bool) onTap;

  SwitchItemWidget({
    Key? key,
    required this.title,
    required this.statu,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileWidget(
        title: TextWidget.body1(
          title,
        ),

        // 右侧箭头
        trailing: <Widget>[
          Switch(
            value: statu,
            onChanged: onTap,
            activeColor: Colors.green,
          ).height(AppSpace.settingListHight)
        ]);
  }
}
