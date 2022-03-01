import 'package:flutter/material.dart';
mixin SpacingMixin {
  /// Sizes
  double get noSpacing => 0;
  double get spacingXS => 1;
  double get spacingS => 2;
  double get spacingM => 4;
  double get spacing => 8;
  double get spacingL => 12;
  double get spacing2 => 16;
  double get spacingXL => 24;
  double get spacing3 => 32;
  double get spacing4 => 48;
  double get spacing5 => 64;
  double get spacing6 => 96;
  double get spacing7 => 128;
  double get spacing8 => 176;
  double get spacing9 => 256;

  /// Utilities for setting margin in all directions
  EdgeInsets get m0 => EdgeInsets.all(noSpacing);
  EdgeInsets get m1 => EdgeInsets.all(spacingXS);
  EdgeInsets get m2 => EdgeInsets.all(spacingS);
  EdgeInsets get m3 => EdgeInsets.all(spacingM);
  EdgeInsets get m4 => EdgeInsets.all(spacing);
  EdgeInsets get m5 => EdgeInsets.all(spacingL);
  EdgeInsets get m6 => EdgeInsets.all(spacing2);
  EdgeInsets get m7 => EdgeInsets.all(spacingXL);
  EdgeInsets get m8 => EdgeInsets.all(spacing3);
  EdgeInsets get m9 => EdgeInsets.all(spacing4);
  EdgeInsets get m10 => EdgeInsets.all(spacing5);
  EdgeInsets get m11 => EdgeInsets.all(spacing6);
  EdgeInsets get m12 => EdgeInsets.all(spacing7);
  EdgeInsets get m13 => EdgeInsets.all(spacing8);
  EdgeInsets get m14 => EdgeInsets.all(spacing9);

  /// Utilities for setting padding in all directions
  EdgeInsets get p0 => EdgeInsets.all(noSpacing);
  EdgeInsets get p1 => EdgeInsets.all(spacingXS);
  EdgeInsets get p2 => EdgeInsets.all(spacingS);
  EdgeInsets get p3 => EdgeInsets.all(spacingM);
  EdgeInsets get p4 => EdgeInsets.all(spacing);
  EdgeInsets get p5 => EdgeInsets.all(spacingL);
  EdgeInsets get p6 => EdgeInsets.all(spacing2);
  EdgeInsets get p7 => EdgeInsets.all(spacingXL);
  EdgeInsets get p8 => EdgeInsets.all(spacing3);
  EdgeInsets get p9 => EdgeInsets.all(spacing4);
  EdgeInsets get p10 => EdgeInsets.all(spacing5);
  EdgeInsets get p11 => EdgeInsets.all(spacing6);
  EdgeInsets get p12 => EdgeInsets.all(spacing7);
  EdgeInsets get p13 => EdgeInsets.all(spacing8);
  EdgeInsets get p14 => EdgeInsets.all(spacing9);

  /// Utilities for setting margin in horizontal directions
  EdgeInsets get mx0 => EdgeInsets.symmetric(horizontal: noSpacing);
  EdgeInsets get mx1 => EdgeInsets.symmetric(horizontal: spacingXS);
  EdgeInsets get mx2 => EdgeInsets.symmetric(horizontal: spacingS);
  EdgeInsets get mx3 => EdgeInsets.symmetric(horizontal: spacingM);
  EdgeInsets get mx4 => EdgeInsets.symmetric(horizontal: spacing);
  EdgeInsets get mx5 => EdgeInsets.symmetric(horizontal: spacingL);
  EdgeInsets get mx6 => EdgeInsets.symmetric(horizontal: spacing2);
  EdgeInsets get mx7 => EdgeInsets.symmetric(horizontal: spacingXL);
  EdgeInsets get mx8 => EdgeInsets.symmetric(horizontal: spacing3);
  EdgeInsets get mx9 => EdgeInsets.symmetric(horizontal: spacing4);
  EdgeInsets get mx10 => EdgeInsets.symmetric(horizontal: spacing5);
  EdgeInsets get mx11 => EdgeInsets.symmetric(horizontal: spacing6);
  EdgeInsets get mx12 => EdgeInsets.symmetric(horizontal: spacing7);
  EdgeInsets get mx13 => EdgeInsets.symmetric(horizontal: spacing8);

  /// Utilities for setting padding in horizontal directions
  EdgeInsets get px0 => EdgeInsets.symmetric(horizontal: noSpacing);
  EdgeInsets get px1 => EdgeInsets.symmetric(horizontal: spacingXS);
  EdgeInsets get px2 => EdgeInsets.symmetric(horizontal: spacingS);
  EdgeInsets get px3 => EdgeInsets.symmetric(horizontal: spacingM);
  EdgeInsets get px4 => EdgeInsets.symmetric(horizontal: spacing);
  EdgeInsets get px5 => EdgeInsets.symmetric(horizontal: spacingL);
  EdgeInsets get px6 => EdgeInsets.symmetric(horizontal: spacing2);
  EdgeInsets get px7 => EdgeInsets.symmetric(horizontal: spacingXL);
  EdgeInsets get px8 => EdgeInsets.symmetric(horizontal: spacing3);
  EdgeInsets get px9 => EdgeInsets.symmetric(horizontal: spacing4);
  EdgeInsets get px10 => EdgeInsets.symmetric(horizontal: spacing5);
  EdgeInsets get px11 => EdgeInsets.symmetric(horizontal: spacing6);
  EdgeInsets get px12 => EdgeInsets.symmetric(horizontal: spacing7);
  EdgeInsets get px13 => EdgeInsets.symmetric(horizontal: spacing8);

  /// Utilities for setting margin in vertical directions
  EdgeInsets get my0 => EdgeInsets.symmetric(vertical: noSpacing);
  EdgeInsets get my1 => EdgeInsets.symmetric(vertical: spacingXS);
  EdgeInsets get my2 => EdgeInsets.symmetric(vertical: spacingS);
  EdgeInsets get my3 => EdgeInsets.symmetric(vertical: spacingM);
  EdgeInsets get my4 => EdgeInsets.symmetric(vertical: spacing);
  EdgeInsets get my5 => EdgeInsets.symmetric(vertical: spacingL);
  EdgeInsets get my6 => EdgeInsets.symmetric(vertical: spacing2);
  EdgeInsets get my7 => EdgeInsets.symmetric(vertical: spacingXL);
  EdgeInsets get my8 => EdgeInsets.symmetric(vertical: spacing3);
  EdgeInsets get my9 => EdgeInsets.symmetric(vertical: spacing4);
  EdgeInsets get my10 => EdgeInsets.symmetric(vertical: spacing5);
  EdgeInsets get my11 => EdgeInsets.symmetric(vertical: spacing6);
  EdgeInsets get my12 => EdgeInsets.symmetric(vertical: spacing7);
  EdgeInsets get my13 => EdgeInsets.symmetric(vertical: spacing8);

  /// Utilities for setting padding in vertical directions
  EdgeInsets get py0 => EdgeInsets.symmetric(vertical: noSpacing);
  EdgeInsets get py1 => EdgeInsets.symmetric(vertical: spacingXS);
  EdgeInsets get py2 => EdgeInsets.symmetric(vertical: spacingS);
  EdgeInsets get py3 => EdgeInsets.symmetric(vertical: spacingM);
  EdgeInsets get py4 => EdgeInsets.symmetric(vertical: spacing);
  EdgeInsets get py5 => EdgeInsets.symmetric(vertical: spacingL);
  EdgeInsets get py6 => EdgeInsets.symmetric(vertical: spacing2);
  EdgeInsets get py7 => EdgeInsets.symmetric(vertical: spacingXL);
  EdgeInsets get py8 => EdgeInsets.symmetric(vertical: spacing3);
  EdgeInsets get py9 => EdgeInsets.symmetric(vertical: spacing4);
  EdgeInsets get py10 => EdgeInsets.symmetric(vertical: spacing5);
  EdgeInsets get py11 => EdgeInsets.symmetric(vertical: spacing6);
  EdgeInsets get py12 => EdgeInsets.symmetric(vertical: spacing7);
  EdgeInsets get py13 => EdgeInsets.symmetric(vertical: spacing8);

  /// Utilities for setting top margin
  EdgeInsets get mt0 => EdgeInsets.only(top: noSpacing);
  EdgeInsets get mt1 => EdgeInsets.only(top: spacingXS);
  EdgeInsets get mt2 => EdgeInsets.only(top: spacingS);
  EdgeInsets get mt3 => EdgeInsets.only(top: spacingM);
  EdgeInsets get mt4 => EdgeInsets.only(top: spacing);
  EdgeInsets get mt5 => EdgeInsets.only(top: spacingL);
  EdgeInsets get mt6 => EdgeInsets.only(top: spacing2);
  EdgeInsets get mt7 => EdgeInsets.only(top: spacingXL);
  EdgeInsets get mt8 => EdgeInsets.only(top: spacing3);
  EdgeInsets get mt9 => EdgeInsets.only(top: spacing4);
  EdgeInsets get mt10 => EdgeInsets.only(top: spacing5);
  EdgeInsets get mt11 => EdgeInsets.only(top: spacing6);
  EdgeInsets get mt12 => EdgeInsets.only(top: spacing7);
  EdgeInsets get mt13 => EdgeInsets.only(top: spacing8);
  EdgeInsets get mt14 => EdgeInsets.only(top: spacing9);

  /// Utilities for setting top padding
  EdgeInsets get pt0 => EdgeInsets.only(top: noSpacing);
  EdgeInsets get pt1 => EdgeInsets.only(top: spacingXS);
  EdgeInsets get pt2 => EdgeInsets.only(top: spacingS);
  EdgeInsets get pt3 => EdgeInsets.only(top: spacingM);
  EdgeInsets get pt4 => EdgeInsets.only(top: spacing);
  EdgeInsets get pt5 => EdgeInsets.only(top: spacingL);
  EdgeInsets get pt6 => EdgeInsets.only(top: spacing2);
  EdgeInsets get pt7 => EdgeInsets.only(top: spacingXL);
  EdgeInsets get pt8 => EdgeInsets.only(top: spacing3);
  EdgeInsets get pt9 => EdgeInsets.only(top: spacing4);
  EdgeInsets get pt10 => EdgeInsets.only(top: spacing5);
  EdgeInsets get pt11 => EdgeInsets.only(top: spacing6);
  EdgeInsets get pt12 => EdgeInsets.only(top: spacing7);
  EdgeInsets get pt13 => EdgeInsets.only(top: spacing8);
  EdgeInsets get pt14 => EdgeInsets.only(top: spacing9);

  /// Utilities for setting bottom margin
  EdgeInsets get mb0 => EdgeInsets.only(bottom: noSpacing);
  EdgeInsets get mb1 => EdgeInsets.only(bottom: spacingXS);
  EdgeInsets get mb2 => EdgeInsets.only(bottom: spacingS);
  EdgeInsets get mb3 => EdgeInsets.only(bottom: spacingM);
  EdgeInsets get mb4 => EdgeInsets.only(bottom: spacing);
  EdgeInsets get mb5 => EdgeInsets.only(bottom: spacingL);
  EdgeInsets get mb6 => EdgeInsets.only(bottom: spacing2);
  EdgeInsets get mb7 => EdgeInsets.only(bottom: spacingXL);
  EdgeInsets get mb8 => EdgeInsets.only(bottom: spacing3);
  EdgeInsets get mb9 => EdgeInsets.only(bottom: spacing4);
  EdgeInsets get mb10 => EdgeInsets.only(bottom: spacing5);
  EdgeInsets get mb11 => EdgeInsets.only(bottom: spacing6);
  EdgeInsets get mb12 => EdgeInsets.only(bottom: spacing7);
  EdgeInsets get mb13 => EdgeInsets.only(bottom: spacing8);
  EdgeInsets get mb14 => EdgeInsets.only(bottom: spacing9);

  /// Utilities for setting bottom padding
  EdgeInsets get pb0 => EdgeInsets.only(bottom: noSpacing);
  EdgeInsets get pb1 => EdgeInsets.only(bottom: spacingXS);
  EdgeInsets get pb2 => EdgeInsets.only(bottom: spacingS);
  EdgeInsets get pb3 => EdgeInsets.only(bottom: spacingM);
  EdgeInsets get pb4 => EdgeInsets.only(bottom: spacing);
  EdgeInsets get pb5 => EdgeInsets.only(bottom: spacingL);
  EdgeInsets get pb6 => EdgeInsets.only(bottom: spacing2);
  EdgeInsets get pb7 => EdgeInsets.only(bottom: spacingXL);
  EdgeInsets get pb8 => EdgeInsets.only(bottom: spacing3);
  EdgeInsets get pb9 => EdgeInsets.only(bottom: spacing4);
  EdgeInsets get pb10 => EdgeInsets.only(bottom: spacing5);
  EdgeInsets get pb11 => EdgeInsets.only(bottom: spacing6);
  EdgeInsets get pb12 => EdgeInsets.only(bottom: spacing7);
  EdgeInsets get pb13 => EdgeInsets.only(bottom: spacing8);
  EdgeInsets get pb14 => EdgeInsets.only(bottom: spacing9);

  /// Utilities for setting left margin
  EdgeInsets get ml0 => EdgeInsets.only(left: noSpacing);
  EdgeInsets get ml1 => EdgeInsets.only(left: spacingXS);
  EdgeInsets get ml2 => EdgeInsets.only(left: spacingS);
  EdgeInsets get ml3 => EdgeInsets.only(left: spacingM);
  EdgeInsets get ml4 => EdgeInsets.only(left: spacing);
  EdgeInsets get ml5 => EdgeInsets.only(left: spacingL);
  EdgeInsets get ml6 => EdgeInsets.only(left: spacing2);
  EdgeInsets get ml7 => EdgeInsets.only(left: spacingXL);
  EdgeInsets get ml8 => EdgeInsets.only(left: spacing3);
  EdgeInsets get ml9 => EdgeInsets.only(left: spacing4);
  EdgeInsets get ml10 => EdgeInsets.only(left: spacing5);
  EdgeInsets get ml11 => EdgeInsets.only(left: spacing6);
  EdgeInsets get ml12 => EdgeInsets.only(left: spacing7);
  EdgeInsets get ml13 => EdgeInsets.only(left: spacing8);
  EdgeInsets get ml14 => EdgeInsets.only(left: spacing9);

  /// Utilities for setting left padding
  EdgeInsets get pl0 => EdgeInsets.only(left: noSpacing);
  EdgeInsets get pl1 => EdgeInsets.only(left: spacingXS);
  EdgeInsets get pl2 => EdgeInsets.only(left: spacingS);
  EdgeInsets get pl3 => EdgeInsets.only(left: spacingM);
  EdgeInsets get pl4 => EdgeInsets.only(left: spacing);
  EdgeInsets get pl5 => EdgeInsets.only(left: spacingL);
  EdgeInsets get pl6 => EdgeInsets.only(left: spacing2);
  EdgeInsets get pl7 => EdgeInsets.only(left: spacingXL);
  EdgeInsets get pl8 => EdgeInsets.only(left: spacing3);
  EdgeInsets get pl9 => EdgeInsets.only(left: spacing4);
  EdgeInsets get pl10 => EdgeInsets.only(left: spacing5);
  EdgeInsets get pl11 => EdgeInsets.only(left: spacing6);
  EdgeInsets get pl12 => EdgeInsets.only(left: spacing7);
  EdgeInsets get pl13 => EdgeInsets.only(left: spacing8);
  EdgeInsets get pl14 => EdgeInsets.only(left: spacing9);

  /// Utilities for setting right margin
  EdgeInsets get mr0 => EdgeInsets.only(right: noSpacing);
  EdgeInsets get mr1 => EdgeInsets.only(right: spacingXS);
  EdgeInsets get mr2 => EdgeInsets.only(right: spacingS);
  EdgeInsets get mr3 => EdgeInsets.only(right: spacingM);
  EdgeInsets get mr4 => EdgeInsets.only(right: spacing);
  EdgeInsets get mr5 => EdgeInsets.only(right: spacingL);
  EdgeInsets get mr6 => EdgeInsets.only(right: spacing2);
  EdgeInsets get mr7 => EdgeInsets.only(right: spacingXL);
  EdgeInsets get mr8 => EdgeInsets.only(right: spacing3);
  EdgeInsets get mr9 => EdgeInsets.only(right: spacing4);
  EdgeInsets get mr10 => EdgeInsets.only(right: spacing5);
  EdgeInsets get mr11 => EdgeInsets.only(right: spacing6);
  EdgeInsets get mr12 => EdgeInsets.only(right: spacing7);
  EdgeInsets get mr13 => EdgeInsets.only(right: spacing8);
  EdgeInsets get mr14 => EdgeInsets.only(right: spacing9);

  /// Utilities for setting right padding
  EdgeInsets get pr0 => EdgeInsets.only(right: noSpacing);
  EdgeInsets get pr1 => EdgeInsets.only(right: spacingXS);
  EdgeInsets get pr2 => EdgeInsets.only(right: spacingS);
  EdgeInsets get pr3 => EdgeInsets.only(right: spacingM);
  EdgeInsets get pr4 => EdgeInsets.only(right: spacing);
  EdgeInsets get pr5 => EdgeInsets.only(right: spacingL);
  EdgeInsets get pr6 => EdgeInsets.only(right: spacing2);
  EdgeInsets get pr7 => EdgeInsets.only(right: spacingXL);
  EdgeInsets get pr8 => EdgeInsets.only(right: spacing3);
  EdgeInsets get pr9 => EdgeInsets.only(right: spacing4);
  EdgeInsets get pr10 => EdgeInsets.only(right: spacing5);
  EdgeInsets get pr11 => EdgeInsets.only(right: spacing6);
  EdgeInsets get pr12 => EdgeInsets.only(right: spacing7);
  EdgeInsets get pr13 => EdgeInsets.only(right: spacing8);
  EdgeInsets get pr14 => EdgeInsets.only(right: spacing9);
}
