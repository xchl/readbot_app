import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 按钮列表项
class StringSelectItemWidget extends StatelessWidget {
  final String title;
  final List<String> options;
  final String selectValue;
  final Function(String?) onTap;

  const StringSelectItemWidget({
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
          DropdownButton<String>(
            value: selectValue,
            icon: null,
            onChanged: (String? value) => onTap(value),
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
          ).height(AppSpace.settingListHight)
        ]);
  }
}
