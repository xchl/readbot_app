import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyMultiLevelOptions extends StatelessWidget {
  final Map<FeedGroupModel, List<FeedModel>> options;
  final FeedGroupModel selectedOption;
  final Function(FeedGroupModel) onOptionSelect;
  final Function(FeedGroupModel) onOptionLongPress;
  final Function(FeedModel) onSubOptionSelect;

  const MyMultiLevelOptions(
      {Key? key,
      required this.options,
      required this.selectedOption,
      required this.onOptionSelect,
      required this.onSubOptionSelect,
      required this.onOptionLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (options.isEmpty) {
      return const SizedBox(
        width: 0,
        height: 0,
      );
    }
    return Row(
      children: <Widget>[
        ListView(
          children: options.keys.map((feedGroup) {
            return ListTile(
              title: TextWidget.body1(feedGroup.name),
              onTap: () => onOptionSelect(feedGroup),
              onLongPress: () => onOptionLongPress(feedGroup),
            ).backgroundColor(feedGroup == selectedOption
                ? AppColors.surface
                : AppColors.background);
          }).toList(),
        ).width(120.w),
        const VerticalDivider(
          thickness: 1,
          width: 1,
        ),
        Expanded(
          child: ListView(
            children: options[selectedOption]!.map((feed) {
              return ListTile(
                title: TextWidget.body1(feed.title),
                onTap: () => onSubOptionSelect(feed),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
