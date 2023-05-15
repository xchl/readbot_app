import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 间距
class AppSpace {
  /// 按钮
  static double get buttonWidth => 10.w;

  /// 按钮
  static double get buttonHeight => 50.h;

  /// 卡片内 - 12 上下左右
  static double get card => 15;

  /// 输入框 - 10, 10 上下，左右
  static EdgeInsetsGeometry get edgeInput =>
      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w);

  /// 列表行 - 10 上下
  static double get listItem => 10.h;

  /// 页面内 - 16 左右
  static double get page => 16.w;

  static double get title => 20.h;

  // TODO fontsize单独一个文件

  static double get iconTextSmail => 5;
  static double get iconTextMedium => 10;
  static double get iconTextLarge => 15;
}
