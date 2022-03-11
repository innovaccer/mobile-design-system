import 'package:flutter/material.dart';

mixin PageHeaderMixin {
  ///AppBar height
  double? preferredSize;
  bool showBackButton = false;

  /// AnimatedPositioned (contains heading and subheading) position from top
  double? headerPositionFromTop;

  /// AnimatedPositioned (contains heading and subheading) position from left
  double? headerPositionFromLeft;
  double? headingFontSize;
  double? subHeadingFontSize;
  double? subHeadingLineHeight;
  double? headingLineHeight;
  double? subHeadingLetterSpacing;
  double? headingLetterSpacing;
  FontWeight? headingFontWeight;
  FontWeight? subHeadingFontWeight;

  /// Color for appbar which switches from secondaryLightest to white and vice-versa
  Color? appBarColor;

  /// Animation Duration for all the animations throughout the widget
  int animationDuration = 160;

  /// App Bar (PreferredSize)  height with subheading
  double? maxAppBarHeightWithSubheading;

  /// App Bar (PreferredSize)  height without subheading
  double? maxAppBarHeightWithoutSubheading;
}
