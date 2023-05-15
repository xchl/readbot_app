import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';

class FeedFilterWidget extends StatelessWidget {
  final List<ExpansionPanelListItem<String, FeedItemWidget>> items;
  const FeedFilterWidget(this.items, {Key? key}) : super(key: key);

  Widget _buildFeedGroup(ExpansionPanelListItem<String, FeedItemWidget> item) {
    return Column(
      children: [
        ListTile(
          title: TextWidget.body2(
            item.headerValue,
            weight: FontWeight.bold,
          ),
        ),
        List.generate(
          item.expandedValue.length,
          (index) => item.expandedValue[index],
        ).toColumn().paddingLeft(5)
      ],
    ).paddingBottom(20);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: List.generate(
            items.length, (index) => _buildFeedGroup(items[index])).toColumn());
  }
}
