
import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 按钮列表项
class NumberSelectItemWidget extends StatelessWidget {
  final String title;
  final List<int> options;
  final int selectValue;
  final Function(int?) onTap;

  const NumberSelectItemWidget({
    Key? key,
    required this.title,
    required this.onTap,
    required this.options,
    required this.selectValue,
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
        trailing: [
          DropdownButton<int>(
            value: selectValue,
            icon: null,
            onChanged: (int? value) => onTap(value),
            items: options.map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
          )
        ]);
  }
}
