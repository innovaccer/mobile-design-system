import 'package:flutter/cupertino.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class ColorTheme {
  final Primary primary;
  final Secondary secondary;
  final Warning warning;
  final Success success;
  final Alert alert;
  final Accent1 accent1;
  final Accent2 accent2;
  final Accent3 accent3;
  final Accent4 accent4;
  final Inverse inverse;
  final Background background;
  final TextColor textColor;
  final TintColor tintColor;
  final Brightness brightness;

  ColorTheme({
    required this.primary,
    required this.secondary,
    required this.success,
    required this.alert,
    required this.warning,
    required this.accent1,
    required this.accent2,
    required this.accent3,
    required this.accent4,
    required this.inverse,
    required this.background,
    required this.textColor,
    required this.tintColor,
    required this.brightness,
  });
}
