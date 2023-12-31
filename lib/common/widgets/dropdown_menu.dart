import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:readbot/common/index.dart';

class DropDownMenu<T> extends StatelessWidget {
  final List<T> options;
  final T selectValue;
  final double? width;
  final Function(T?) onTap;

  const DropDownMenu(
      {Key? key,
      required this.onTap,
      required this.options,
      required this.selectValue,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2<T>(
            items: options
                .map(
                  (item) => DropdownMenuItem<T>(
                    value: item,
                    child: TextWidget.body1(item.toString()),
                  ),
                )
                .toList(),
            value: selectValue,
            onChanged: (T? value) => onTap(value),
            iconStyleData: const IconStyleData(
              icon: Icon(Icons.expand_more),
            ),
            dropdownStyleData: DropdownStyleData(
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.card),
                color: AppColors.background,
              ),
              elevation: 1,
            ))).height(AppSpace.settingListHight);
  }
}
