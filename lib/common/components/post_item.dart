import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';

/// 功能栏项
class PostItemWidget extends StatelessWidget {
  final Post post;

  const PostItemWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  Widget _buildImageBlock() {
    return const ImageWidget.asset(AssetsImages.defaultPng);
  }

  Widget _buildTextBlock() {
    return TextWidget.title3(post.title!);
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 文字Block
      _buildTextBlock(),
      // 图片Block
      _buildImageBlock(),
    ].toColumn();
  }
}
