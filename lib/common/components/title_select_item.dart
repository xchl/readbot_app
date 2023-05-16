import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';

/// 按钮列表项
class TitleSelectItemWidget<T> extends StatelessWidget {
  final String title;
  final List<T> options;
  final T selectValue;
  final double? width;
  final Function(T?) onTap;

  const TitleSelectItemWidget(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.options,
      required this.selectValue,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileWidget(
      title: TextWidget.body1(
        title,
      ),
      trailing: [
        DropDownMenu(
          onTap: onTap,
          options: options,
          selectValue: selectValue,
          width: width,
        )
      ],
    );
  }
}
