import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';

class FeedFilterWidget extends StatelessWidget {
  final Map<FeedGroup, List<Feed>> groupFeed;

  const FeedFilterWidget(this.groupFeed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Item<String, FeedItemWidget>> items = groupFeed.entries
        .map((e) => Item(
            headerValue: e.key.name!, // TODO
            expandedValue: e.value
                .map((e) => FeedItemWidget(
                      title: e.title,
                      logoUrl: e.logo,
                    ))
                .toList()))
        .toList();
    return SingleChildScrollView(
      child: ExpansionPanelList(
          expansionCallback: (index, isExpanded) {
            items[index].isExpanded = !isExpanded;
          },
          children:
              items.map<ExpansionPanel>((Item<String, FeedItemWidget> item) {
            return ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: TextWidget.body1(item.headerValue),
                  );
                },
                body: Column(
                  children: item.expandedValue,
                ),
                isExpanded: item.isExpanded);
          }).toList()),
    );
  }
}

class Item<H, E> {
  Item(
      {required this.expandedValue,
      required this.headerValue,
      this.isExpanded = true});
  List<E> expandedValue;
  H headerValue;
  bool isExpanded;
}
