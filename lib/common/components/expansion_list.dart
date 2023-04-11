class ExpansionPanelListItem<H, E> {
  ExpansionPanelListItem(
      {required this.expandedValue,
      required this.headerValue,
      this.isExpanded = true});
  List<E> expandedValue;
  H headerValue;
  bool isExpanded;
}
