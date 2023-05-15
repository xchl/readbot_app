import 'package:flutter/material.dart';
import 'package:readbot/common/index.dart';

Future<void> showCustomModalBottomSheet({
  required BuildContext context,
  required Widget Function(BuildContext context) builder,
  bool isScrollControlled = true,
}) {
  return showModalBottomSheet<void>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppRadius.sheet), // 设置顶部的圆角大小
      ),
    ),
    builder: (context) {
      return Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: builder(context),
      );
    },
    isScrollControlled: isScrollControlled,
  );
}
