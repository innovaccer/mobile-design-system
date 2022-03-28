import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/src/design_system/widgets/atoms/typography/scaler/text_scaler.dart';
import 'package:innovaccer_design_system/src/theme/mixin/color_mixin.dart';
import 'package:innovaccer_design_system/src/theme/mixin/font_mixin.dart';

enum TitleType {
  largeTitle,
  title1,
  title2,
  title3,
}

enum TitleAppearance {
  /// cannot call it default as it is keyword
  defaultType
}

class MDSTitle extends StatelessWidget with ColorMixin, FontMixin {
  final TitleType type;
  final TitleAppearance appearance;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final String text;

  MDSTitle(
    this.text, {
    this.type = TitleType.title1,
    this.appearance = TitleAppearance.defaultType,
    this.textAlign,
    this.maxLines,
    this.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return Container();
    }

    double? _textScaleFactor = 1.0;
    // ignore: unnecessary_null_comparison
    if (TextScaler?.of<TextScalingFactor>(context) != null) {
      _textScaleFactor = TextScaler.of<TextScalingFactor>(context)?.scaleFactor;
    }
    double verticalPadding =
        ((_fontLineHeightMapping[type]?[appearance] ?? fontLineHeight36) -
                (_fontSizeMapping[type]?[appearance] ?? fontSize28)) /
            2;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
      ),
      child: Text(
        text,
        style: _getStyle(),
        textAlign: textAlign ?? TextAlign.left,
        maxLines: maxLines,
        overflow: textOverflow,
        textScaleFactor: _textScaleFactor,
      ),
    );
  }

  TextStyle _getStyle() {
    return TextStyle(
      fontSize: _fontSizeMapping[type]?[appearance],
      fontWeight: _fontWeightMapping[type]?[appearance],
      color: textColor,
      letterSpacing: _fontLetterSpacingMapping[type]?[appearance],
    );
  }

  Map<TitleType, Map<TitleAppearance, double>> get _fontSizeMapping => {
        TitleType.largeTitle: {TitleAppearance.defaultType: fontSize34},
        TitleType.title1: {TitleAppearance.defaultType: fontSize28},
        TitleType.title2: {TitleAppearance.defaultType: fontSize22},
        TitleType.title3: {TitleAppearance.defaultType: fontSize20}
      };

  Map<TitleType, Map<TitleAppearance, FontWeight>> get _fontWeightMapping => {
        TitleType.largeTitle: {TitleAppearance.defaultType: FontWeight.w700},
        TitleType.title1: {TitleAppearance.defaultType: FontWeight.w700},
        TitleType.title2: {TitleAppearance.defaultType: FontWeight.w500},
        TitleType.title3: {TitleAppearance.defaultType: FontWeight.w500}
      };

  Map<TitleType, Map<TitleAppearance, double>> get _fontLineHeightMapping => {
        TitleType.largeTitle: {TitleAppearance.defaultType: fontLineHeight40},
        TitleType.title1: {TitleAppearance.defaultType: fontLineHeight36},
        TitleType.title2: {TitleAppearance.defaultType: fontLineHeight28},
        TitleType.title3: {TitleAppearance.defaultType: fontLineHeight24}
      };

  Map<TitleType, Map<TitleAppearance, double>> get _fontLetterSpacingMapping =>
      {
        TitleType.largeTitle: {TitleAppearance.defaultType: letterSpacing8},
        TitleType.title1: {TitleAppearance.defaultType: letterSpacing7},
        TitleType.title2: {TitleAppearance.defaultType: letterSpacing6},
        TitleType.title3: {TitleAppearance.defaultType: letterSpacing9}
      };
}
