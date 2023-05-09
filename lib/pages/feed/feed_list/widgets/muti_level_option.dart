import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyMultiLevelOptions extends StatefulWidget {
  final Map<FeedGroupModel, List<FeedModel>> options;

  const MyMultiLevelOptions({Key? key, required this.options})
      : super(key: key);

  @override
  MyMultiLevelOptionsState createState() => MyMultiLevelOptionsState();
}

class MyMultiLevelOptionsState extends State<MyMultiLevelOptions> {
  FeedGroupModel? selectedOption;

  @override
  Widget build(BuildContext context) {
    if (widget.options.isEmpty) {
      return const SizedBox(
        width: 0,
        height: 0,
      );
    }
    selectedOption = widget.options.keys.first;
    return Row(
      children: <Widget>[
        Column(
          children: widget.options.keys.map((feedGroup) {
            return ListTile(
              title: Text(feedGroup.name),
              onTap: () {
                setState(() {
                  selectedOption = feedGroup;
                });
              },
            );
          }).toList(),
        ).width(120.w),
        const VerticalDivider(
          thickness: 1,
          width: 1,
        ),
        Expanded(
          child: ListView(
            children:
                (selectedOption == null ? [] : widget.options[selectedOption]!)
                    .map((feed) {
              return ListTile(
                title: Text(feed.title),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
