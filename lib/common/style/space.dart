import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 间距
class AppSpace {
  /// 卡片内 - 12 上下左右
  static double get card => 15;

  /// 输入框 - 10, 10 上下，左右
  static EdgeInsetsGeometry get edgeInput =>
      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w);

  /// 列表行 - 10 上下
  static double get listItem => 10.h;

  static double get seqHorization => 5.w;
  static double get seqVertical => 5.h;
  static double get seqx2Horization => 10.w;
  static double get seqx2Vertical => 10.h;

  /// 页面内 - 16 左右
  static double get page => 10.w;

  static double get title => 20.h;

  static double get settingListHight => 30.h;

  // 刷新按钮
  static double get refreshDisplacement => 40.h;
}
