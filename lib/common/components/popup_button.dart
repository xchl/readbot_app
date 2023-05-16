import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';

/// 按钮列表项
class PopupButtonWidget extends StatelessWidget {
  final List<ButtonWidget> options;
  final double? width;

  const PopupButtonWidget({
    Key? key,
    required this.options,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2(
            items: options
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: item,
                  ),
                )
                .toList(),
            onChanged: (ButtonWidget? value) => value?.onTap,
            iconStyleData: IconStyleData(
              icon: IconWidget.svg(
                AssetsSvgs.plusLgSvg,
                color: AppColors.titleColor,
              ).paddingRight(AppSpace.listItem),
            ),
            dropdownStyleData: DropdownStyleData(
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.card),
                color: AppColors.background,
              ),
              elevation: 1,
            )));
  }
}
