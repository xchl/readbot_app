import 'package:flutter/material.dart';
import 'package:readbot/common/index.dart';

class DescriptionItem extends StatelessWidget {
  final TextWidget text;
  final IconWidget icon;

  const DescriptionItem({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      icon.paddingRight(AppSpace.seqHorization),
      text,
    ].toRow();
  }
}
