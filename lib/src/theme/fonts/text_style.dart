import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class AppTextStyle with FontMixin {
  /// Get the Style of the Text.
  /// [fontWeight] & [fontSize] are required.
  /// [fontColor] is optional and set to black by default.
  /// [lineHeight] is optional and if set, it is calculated by lineHeight in [sp] / fontSize
  static TextStyle getStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color fontColor = Colors.black,
    double? lineHeight,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: fontColor,
      height: lineHeight != null ? lineHeight / fontSize : null,
      letterSpacing: letterSpacing ?? AppTextStyle().letterSpacing,
    );
  }
}
