import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 应用颜色
class AppColors {
  /// *******************************************
  /// 自定义 颜色
  /// *******************************************

  static Color get hideColor =>
      Get.isDarkMode ? const Color(0xFF4B5563) : const Color(0xFFA6A3A3);

  static Color get background =>
      Get.isDarkMode ? const Color(0xFF111827) : const Color(0xFFFEFEFE);

  static Color get navigationBarColor =>
      Get.isDarkMode ? const Color(0xFF111827) : const Color(0xFFF5F5F5);

  static Color get textOnNavigationBarColor =>
      Get.isDarkMode ? const Color(0xFF828080) : const Color(0xFF828080);

  static Color get selectTextOnNavigationBarColor =>
      Get.isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF000000);

  static Color get titleColor =>
      Get.isDarkMode ? const Color(0xFFEEEEEE) : const Color(0xFF000000);

  static Color get textColor => Get.isDarkMode ? Colors.white : Colors.black;

  static Color get primary =>
      Get.isDarkMode ? const Color(0xFF256AF1) : const Color(0xFF256AF1);

  static Color get onPrimary =>
      Get.isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF);

  static Color get error => Get.theme.colorScheme.error;

  static Color get errorContainer => Get.theme.colorScheme.errorContainer;

  static Color get inversePrimary => Get.theme.colorScheme.inversePrimary;

  static Color get inverseSurface => Get.theme.colorScheme.inverseSurface;

  static Color get onBackground => Get.theme.colorScheme.onBackground;

  static Color get onError => Get.theme.colorScheme.onError;

  static Color get onErrorContainer => Get.theme.colorScheme.onErrorContainer;

  static Color get onInverseSurface => Get.theme.colorScheme.onInverseSurface;

  static Color get onPrimaryContainer =>
      Get.theme.colorScheme.onPrimaryContainer;

  static Color get onSecondary => Get.theme.colorScheme.onSecondary;

  static Color get onSecondaryContainer =>
      Get.theme.colorScheme.onSecondaryContainer;

  static Color get onSurface => Get.theme.colorScheme.onSurface;

  static Color get onSurfaceVariant => Get.theme.colorScheme.onSurfaceVariant;

  static Color get onTertiary => Get.theme.colorScheme.onTertiary;

  static Color get onTertiaryContainer =>
      Get.theme.colorScheme.onTertiaryContainer;

  static Color get outline => Get.theme.colorScheme.outline;

  static Color get primaryContainer => Get.theme.colorScheme.primaryContainer;

  static Color get secondary => Get.theme.colorScheme.secondary;

  static Color get secondaryContainer =>
      Get.theme.colorScheme.secondaryContainer;

  static Color get shadow => Get.theme.colorScheme.shadow;

  static Color get surface => Get.theme.colorScheme.surface;

  static Color get surfaceVariant => Get.theme.colorScheme.surfaceVariant;

  static Color get tertiary => Get.theme.colorScheme.tertiary;

  static Color get tertiaryContainer => Get.theme.colorScheme.tertiaryContainer;
}
