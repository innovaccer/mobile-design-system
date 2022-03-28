import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/src/design_system/widgets/atoms/typography/scaler/text_scaler.dart';
import 'package:innovaccer_design_system/src/theme/mixin/color_mixin.dart';
import 'package:innovaccer_design_system/src/theme/mixin/font_mixin.dart';

enum HeadlineAppearance {
  /// cannot call it default as it is keyword
  defaultType
}

class MDSHeadline extends StatelessWidget with ColorMixin, FontMixin {
  final HeadlineAppearance appearance;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final String text;

  MDSHeadline(
    this.text, {
    this.appearance = HeadlineAppearance.defaultType,
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
    if (TextScaler.of<TextScalingFactor>(context) != null) {
      _textScaleFactor = TextScaler.of<TextScalingFactor>(context)?.scaleFactor;
    }
    double verticalPadding =
        ((_fontLineHeightMapping[appearance] ?? fontLineHeight24) -
                (_fontSizeMapping[appearance] ?? fontSize17)) /
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
      fontSize: _fontSizeMapping[appearance],
      fontWeight: _fontWeightMapping[appearance],
      color: textColor,
      letterSpacing: _fontLetterSpacingMapping[appearance],
    );
  }

  Map<HeadlineAppearance, double> get _fontSizeMapping =>
      {HeadlineAppearance.defaultType: fontSize17};

  Map<HeadlineAppearance, FontWeight> get _fontWeightMapping =>
      {HeadlineAppearance.defaultType: FontWeight.w600};

  Map<HeadlineAppearance, double> get _fontLineHeightMapping =>
      {HeadlineAppearance.defaultType: fontLineHeight24};

  Map<HeadlineAppearance, double> get _fontLetterSpacingMapping =>
      {HeadlineAppearance.defaultType: letterSpacing1};
}
